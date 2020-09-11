require 'rails_helper'
RSpec.feature "user logs in" do
 scenario "using google oauth2" do
  mock_user
  visit root_path

  click_button "Login with Google to Start Glitching"
  expect(page).to have_content("Sample Name")
  expect(page).to have_content("name@name.com")
 end
end
