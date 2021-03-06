require 'rails_helper'

feature "Enrollments", :type => :feature do
  scenario 'the user can enroll in a free course without a credit card' do
    sign_in_as(FactoryGirl.create(:user))
    course = FactoryGirl.create(:course, cost: 0)
    visit course_path(course)
    click_link 'Enroll'
    expect(course.enrollments.count).to eq 1
    expect(page).to have_content 'Enrolled'
  end
end
