require 'rails_helper'

RSpec.feature "SignUps" do
  scenario 'create account' do
    visit root_path
    click_link 'Create account'
    fill_in 'Email',                 with: 'user@example.com'
    fill_in :user_password,          with: 'supersecret'
    fill_in 'Password confirmation', with: 'supersecret'
    click_button 'Sign up'
    expect(page).to have_content 'successfully'
    expect(page).to_not have_link 'Create account'
  end
end
