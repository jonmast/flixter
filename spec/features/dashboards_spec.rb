require 'rails_helper'

feature "Dashboards", :type => :feature do
  scenario 'user visits dashboard' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit dashboard_path
    expect(page).to have_css(:h1, text: "What I'm Learning")
  end

  scenario 'user not signed in' do
    visit dashboard_path
    expect(current_path).to eq new_user_session_path
  end
end
