class Instructor::SectionsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @section = Section.new(course: @course)
  end

  def create
    @course = Course.find(params[:course_id])
    @section = @course.sections.new(section_params)
    if @section.save
      redirect_to instructor_course_path(@course)
    else
      render :new
    end
  end

  private

  def section_params
    params.require(:section).permit(:title)
  end
end
