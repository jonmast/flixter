require 'rails_helper'

feature "CourseSections", :type => :feature do
  scenario 'add a section' do
    course = FactoryGirl.create(:course)
    sign_in_as(course.user)
    visit new_instructor_course_section_path(course)
    expect(page).to have_css(:h1, text: 'Add a new section')
    fill_in 'Title', with: 'Great section title'
    click_button 'Add a section'
    expect(course.reload.sections.count).to eq 1
    expect(page).to have_css(:li, text: 'Great section title')
  end

  scenario 'invalid data' do
    course = FactoryGirl.create(:course)
    sign_in_as(course.user)
    visit new_instructor_course_section_path(course)
    click_button 'Add a section'
    expect(page).to have_css(:h1, 'Add a new section')
  end

  scenario 'not logged in' do
    course = FactoryGirl.create(:course)
    visit new_instructor_course_section_path(course)
    expect(current_path).to eq new_user_session_path
  end

  scenario 'wrong user' do
    course = FactoryGirl.create(:course)
    user = FactoryGirl.create(:user)
    sign_in_as user

    visit new_instructor_course_section_path(course)
    expect(page).to have_content('Unauthorized')
  end
end
