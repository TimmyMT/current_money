require 'rails_helper'

feature 'View main page' do
  describe 'Admin' do
    given!(:admin) {create(:user, admin: true)}
    before { sign_in(admin) }

    scenario 'admin can see Force course link' do
      visit root_path
      expect(page).to have_content "Dynamic course history"
      expect(page).to have_css ".current_course"
      expect(page).to have_link "Force course"
    end
  end

  describe 'User' do
    given!(:user) {create(:user)}
    before { sign_in(user) }

    scenario 'user cant see Force course link' do
      visit root_path
      expect(page).to have_content "Dynamic course history"
      expect(page).to have_css ".current_course"
    end
  end

  describe 'Guest' do
    scenario 'tries to see course history' do
      visit root_path
      expect(page).to have_content "Dynamic course history"
      expect(page).to have_css ".current_course"
    end
  end
end
