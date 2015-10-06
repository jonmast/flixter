require 'rails_helper'

feature "ShowCourses", :type => :feature do
  scenario 'show course' do
    course = FactoryGirl.create(:course)
    visit course_path(course)
    expect(page).to have_content(course.description)
  end
end
