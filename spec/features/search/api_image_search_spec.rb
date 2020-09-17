require 'rails_helper'

RSpec.describe "Search ApiImages" do
  before :each do
    user = User.from_omniauth(mock_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit dashboard_path
    fill_in :search, with: "Cat"
    click_on 'Search'
  end
  it "can search an image via keyword" do
    expect(current_path).to eq(search_path)
    expect(page).to have_button("Glitch Image")
    expect(page).to have_button("Glitch Image")
  end
  it "can save an image from Deep AI" do
    within(".image-Deep-AI") do
      expect(ApiImage.count).to eq(0)
      click_button "Glitch Image"
      expect(ApiImage.count).to eq(1)
      image = ApiImage.last
      expect(current_path).to eq(search_show_path(image))
    end
  end
  it "can save an image from Pixabay" do
    within(".image-Pixabay") do
      expect(ApiImage.count).to eq(0)
      click_button "Glitch Image"
      expect(ApiImage.count).to eq(1)
      image = ApiImage.last
      expect(current_path).to eq(search_show_path(image))
    end
  end
  it "can search an image via two keywords" do
    user = User.from_omniauth(mock_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit dashboard_path
    fill_in :search, with: "white dog"
    click_on 'Search'
    expect(current_path).to eq(search_path)
  end
end
