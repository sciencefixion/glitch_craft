require 'rails_helper'
RSpec.feature "user logs in" do
 scenario "using google oauth2" do
  mock_user
  visit root_path

  click_link "Login with Google to Start Glitching"
  expect(page).to have_content("Sample Name")
 end
 it "and user logs out" do
   mock_user
   visit root_path

   click_link "Login with Google to Start Glitching"
   expect(page).to have_content("Sample Name")
   click_on 'Logout'

   expect(current_path).to eq(root_path)
   expect(page).to_not have_content("Sample Name")
 end
end
