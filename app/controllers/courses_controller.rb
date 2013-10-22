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
      if @quiz_content.answers[params[:answer].to_i].right != true
        flash[:notice] = "Ответ не верный #{@quiz_content.id}"
      else
          progress = @user.progress["#{@course.id}"]["#{@quiz_content.id}"] || 0
          @user.progress["#{@course.id}"]["#{@quiz_content.id}"] = progress + 1
          @user.save
          flash[:notice] = "Ответ верный #{@user.progress}"
      end
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

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new

    1.times do
      chapter = @course.chapters.build
      1.times do
        question = chapter.questions.build
        2.times { question.answers.build }
      end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end
end
