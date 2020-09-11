require 'rails_helper'
RSpec.feature "user logs in" do
 scenario "using google oauth2" do
  mock_user
  visit root_path

  click_link "Login with Google to Start Glitching"
  expect(page).to have_content("Sample Name")
 end
end
