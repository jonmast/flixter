require 'rails_helper'

feature "Lessons", :type => :feature do
  scenario 'show lesson if enrolled' do
    lesson = FactoryGirl.create(:lesson)
    user = FactoryGirl.create(:user)
    user.enrolled_courses << lesson.section.course
    sign_in_as user
    visit lesson_path(lesson)
    expect(page).to have_css(:h1, text: lesson.title)
  end

  scenario 'user must be enrolled to view lesson' do
    lesson = FactoryGirl.create(:lesson)
    sign_in_as FactoryGirl.create(:user)
    visit lesson_path(lesson)
    expect(current_path).to eq course_path(lesson.course)
    expect(page).to_not have_css(:h1, text: lesson.title)
  end
end
