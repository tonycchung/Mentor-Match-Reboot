require "test_helper"

feature "All types users will have to ability to sign out" do

  scenario "as an mentee I can sign out and will be redirected to the home page" do
    sign_in_mentee
    click_link("sign out")
    page.text.must_include "Dexter"
  end

  scenario "as an mentor I can sign out and will be redirected to the home page" do
    sign_in_mentor
    # first(:link, "Sign out").click
    click_link("sign out")
    page.text.must_include "Dexter"
  end

  scenario "as an admin I can sign out and will be redirected to the home page" do
    sign_in_admin
    click_link("sign out")
    page.text.must_include "Dexter"
  end
end
