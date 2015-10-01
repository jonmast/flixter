require 'rails_helper'

feature 'AddCourses', :type => :feature do
  scenario 'not logged in' do
    visit new_instructor_course_path
    expect(current_path).to eq new_user_session_path
  end
  scenario 'add course' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit new_instructor_course_path
    expect(page).to have_css 'h1', text: 'Add a new course'
    fill_in 'Title', with: 'My course title'
    fill_in 'Description', with: 'This is a really great course'
    fill_in 'Cost', with: 34.82
    click_button 'Create'
    expect(page).to have_css 'h1', text: 'My course title'
  end

  scenario 'with invalid data' do
    sign_in_as(FactoryGirl.create(:user))
    visit new_instructor_course_path
    expect { click_button 'Create' }.to_not change { Course.count }
    expect(page).to have_css 'h1', text: 'Add a new course'
  end
end
