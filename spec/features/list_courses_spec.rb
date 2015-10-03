require 'rails_helper'

feature "ListCourses", :type => :feature do
  scenario 'list courses' do
    courses = FactoryGirl.create_list(:course, 5)
    visit courses_path
    courses.each do |course|
      expect(page).to have_content course.title
    end
  end
end
