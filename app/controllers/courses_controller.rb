# coding: utf-8
class CoursesController < ApplicationController
  before_filter :authenticate_user!
  layout "courses"
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
    @course_types = CourseType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show

    @course = Course.find(params[:id])
    @course_type = CourseType.find(@course.course_type_id)

    @chapter_content = params[:index] ? @course.chapters[params[:index].to_i] : @course.chapters[0]
    
    @course.set_defaults(current_user, @course) if current_user.progress.nil?

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  def quiz

    @course = Course.find(params[:id])
    @course_type = CourseType.find(@course.course_type_id)
    @quiz_content = params[:index] ? @course.questions[params[:index].to_i] : @course.questions[0]
    if params[:answer]
      @user = User.find(current_user.id)
      
      if @quiz_content.answers[params[:answer].to_i].right?
          if @user.progress.nil?
            @user.progress = { 
              "#{@course.course_type_id}" => { 
                "#{@course.id}" => { 
                  "#{@quiz_content.id}" => { 
                    points: 0,
                    trying: 0
                  }
                }
              }
            }
          else
            progress = @user.progress["#{@course.id}"]["#{@quiz_content.id}"] ||= 0
            @user.progress["#{@course.id}"]["#{@quiz_content.id}"] = progress + 1
          end
          @user.save
          
          notice = "Ответ верный #{@user.progress}"
      end
      redirect_to(request.url, notice: notice) and return
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/:slug/1
  # GET /courses/:slug/1.json
  def type
    #@course = Course.find(params[:id])
    @all_courses = Course.all
    @course_type = CourseType.named(params[:slug]).first
    @courses = Course.typed(@course_type).order_by([[:level, :asc],[:position, :asc]])
    
    @crs = @courses.group_by { |item| item.level }
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @courses }
    end
  end

end
