require 'rails_helper'

feature 'View force cource page' do
  describe 'Admin' do
    given!(:admin) {create(:user, admin: true)}
    before { sign_in(admin) }

    scenario 'admin can see Force course link' do
      visit root_path
      expect(page).to have_link "Force course"
      click_on "Force course"
      expect(page).to have_content "Set up Forced Course"
    end
  end

  describe 'User' do
    given!(:user) {create(:user)}
    before { sign_in(user) }

    scenario 'User cant see Force course link' do
      visit root_path
      expect(page).to_not have_link "Force course"
    end
  end

  describe 'Guest' do
    scenario 'guest cant see Force course link' do
      visit root_path
      expect(page).to_not have_link "Force course"
    end
  end
end
