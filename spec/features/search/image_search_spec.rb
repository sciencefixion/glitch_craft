require 'rails_helper'

RSpec.describe "Search Images" do
  before :each do
    user = User.from_omniauth(mock_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit dashboard_path
    fill_in :search, with: "Cat"
    click_on 'Search'
  end
  it "can search an image via keyword" do
    expect(current_path).to eq(search_path)
    expect(page).to have_button("Select Deep AI Image")
    expect(page).to have_button("Select Pixabay Image")
  end
  it "can save an image from Deep AI" do
    expect(Image.count).to eq(0)
    click_button "Select Deep AI Image"
    expect(Image.count).to eq(1)
    image = Image.last
    expect(current_path).to eq(search_show_path(image))
    expect(page).to have_css(".image")
  end
  it "can save an image from Pixabay" do
    expect(Image.count).to eq(0)
    click_button "Select Pixabay Image"
    expect(Image.count).to eq(1)
    image = Image.last
    expect(current_path).to eq(search_show_path(image))
    expect(page).to have_css(".image")
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
