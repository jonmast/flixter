class Instructor::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user_for_course, only: :show
  helper_method :current_course
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params.merge(user: current_user))
    if @course.save
      redirect_to instructor_course_path(@course)
    else
      render :new
    end
  end

  def show
    @section = Section.new
  end

  private

  def authorize_user_for_course
    render text: 'Unauthorized', status: :unauthorized unless current_course.user == current_user
  end

  def current_course
    @current_course ||= Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :cost, :image)
  end
end
