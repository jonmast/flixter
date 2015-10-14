class Instructor::LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user_for_section
  helper_method :current_section

  def new
    @lesson = current_section.lessons.new
  end

  def create
    @lesson = current_section.lessons.new(lesson_params)
    if @lesson.save
      redirect_to instructor_course_path(current_section.course)
    else
      render :new
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle)
  end

  def authorize_user_for_section
    render text: 'Unauthorized' unless current_section.course.user == current_user
  end

  def current_section
    @current_section || Section.find(params[:section_id])
  end
end
