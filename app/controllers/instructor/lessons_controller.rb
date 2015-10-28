class Instructor::LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user_for_section, except: :update
  before_action :authorize_lesson_admin, only: :update
  helper_method :current_section

  def create
    @lesson = current_section.lessons.new(lesson_params)
    if @lesson.save
      redirect_to instructor_course_path(current_section.course)
    else
      render :new
    end
  end

  def update
    current_lesson.update_attributes(lesson_params)
    render text: 'Success'
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle, :video, :row_order_position)
  end

  def authorize_user_for_section
    render text: 'Unauthorized' unless current_section.course.user == current_user
  end

  def authorize_lesson_admin
    render text: 'Unauthorized' unless current_lesson.user == current_user
  end

  def current_section
    @current_section ||= Section.find(params[:section_id])
  end

  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
