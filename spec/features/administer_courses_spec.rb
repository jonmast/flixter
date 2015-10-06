require 'rails_helper'

feature "AdministerCourses", :type => :feature do
  scenario 'edit a course' do
    user = FactoryGirl.create(:user)
    course = FactoryGirl.create(:course, user: user)
    sign_in_as(user)
    visit course_path(course)
    click_link 'Administer'
  end
end
