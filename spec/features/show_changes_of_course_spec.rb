require 'rails_helper'

feature 'All users can see new course' do
  context "Multiple sessions", js: true do
    given!(:admin) {create(:user, admin: true)}
    given!(:user) {create(:user)}

    scenario "created new course", js: true do

      Capybara.using_session('admin') do
        sign_in(admin)
        visit root_path

        expect(page).to_not have_css ".current_course"
      end

      Capybara.using_session('user') do
        sign_in(user)
        visit root_path

        expect(page).to_not have_css ".current_course"
      end

      Capybara.using_session('guest') do
        visit root_path

        expect(page).to_not have_css ".current_course"
      end

      Course.create!(value: "50")

      Capybara.using_session('admin') do
        within ".current_course" do
          expect(page).to have_content "50 RUB"
        end
      end

      Capybara.using_session('user') do
        within ".current_course" do
          expect(page).to have_content "50 RUB"
        end
      end

      Capybara.using_session('guest') do
        within ".current_course" do
          expect(page).to have_content "50 RUB"
        end
      end

      Capybara.using_session('admin') do
        click_on "Force course"
        expect(page).to have_content "Set up Forced Course"
        fill_in "Value", with: "47"
        click_on "Create Course"

        within ".current_course" do
          expect(page).to have_content "47 RUB"
        end
      end

      Capybara.using_session('user') do
        within ".current_course" do
          expect(page).to have_content "47 RUB"
        end
      end

      Capybara.using_session('guest') do
        within ".current_course" do
          expect(page).to have_content "47 RUB"
        end
      end
    end
  end
end
