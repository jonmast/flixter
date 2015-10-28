class Instructor::SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user_for_course
  helper_method :current_course

  def new
    @section = Section.new(course: current_course)
  end

  def create
    @section = current_course.sections.new(section_params)
    if @section.save
      redirect_to instructor_course_path(current_course)
    else
      render :new
    end
  end

  def update
    current_section.update_attributes(section_params)
    render text: 'Success'
  end

  private

  def section_params
    params.require(:section).permit(:title, :row_order_position)
  end

  def current_course
    @current_course ||=
      if params[:course_id]
        Course.find(params[:course_id])
      else
        current_section.course
      end
  end

  def current_section
    @current_section ||= Section.find(params[:id])
  end

  def authorize_user_for_course
    render text: 'Unauthorized', status: :unauthorized unless current_course.user == current_user
  end
end
