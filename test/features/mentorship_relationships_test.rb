require "test_helper"

feature "A mentor and mentee can interact with eachother" do
  scenario "As a mentee, I want to be able to view mentors" do
    sign_in_mentee
    visit users_path
    page.text.must_include "Mentor"
    page.text.wont_include "Mentee"
  end

  scenario "As a mentor, I want to be able to view mentees" do
    sign_in_mentor
    visit users_path
    page.text.must_include "Mentee"
    page.text.wont_include "Mentor"
  end

  scenario "As a mentee, I want to be able to bookmark a mentor for future reference" do
    sign_in_mentee
    visit users_path
    click_on "View Profile"
    click_on "Add to favorites"
    visit dashboard_path
    click_on "View Favorites"
    page.text.must_include "Mentor"
  end
end
