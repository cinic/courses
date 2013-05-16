class PracticeController < ApplicationController
  def index
  	@courses = Course.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end
end
