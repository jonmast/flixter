class Instructor::CoursesController < ApplicationController
  before_filter :authenticate_user!
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to instructor_course_path(@course)
    else
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :cost)
  end
end
