require 'rails_helper'

feature "Lessons", :type => :feature do
  scenario 'create lesson' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    section = FactoryGirl.create(:section)

    visit new_instructor_section_lesson_path(section)
    expect(page).to have_css(:h1, text: 'Add a new lesson')

    fill_in 'Title', with: 'Lesson title'
    fill_in 'Subtitle', with: 'Lesson subtitle'
    click_button 'Add lesson'

    expect(section.lessons.count).to eq 1
    expect(page).to have_content 'Lesson title'
  end
end
