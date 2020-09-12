require 'rails_helper'

RSpec.describe "Search Images" do
  it "can search an image via keyword" do
    user = User.from_omniauth(mock_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit dashboard_path

    fill_in :search, with: "Cats"
    click_link 'Search'
    expect(current_path).to eq(search_path)
    expect(page).to have_css(".image-Deep AI")
    expect(page).to have_css(".image-Pixabay")
    expect(page).to have_button("Select Deep AI Image")
    expect(page).to have_button("Select Pixabay Image")
  end
end
