class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_enrollment

  def show
  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def current_course
    current_lesson.course
  end

  def check_enrollment
    redirect_to course_path(current_course),
      alert: 'You must be enrolled to view a lesson' unless user_enrolled?
  end

  def user_enrolled?
    current_user.enrolled_in?(current_course)
  end
end
