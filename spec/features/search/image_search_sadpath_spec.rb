require 'rails_helper'

RSpec.describe "Search Images" do
  it "cannot search an image via invalid keyword" do
    user = User.from_omniauth(mock_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit dashboard_path
    fill_in :search, with: "(&^&^*$&)"
    click_on 'Search'
    expect(current_path).to eq('/400')
    expect(page).to have_content("400")
    click_on 'Use one or two real words this time.'
    expect(current_path).to eq('/dashboard')
  end
  it "cannot search an image via three keywords" do
    user = User.from_omniauth(mock_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit dashboard_path
    fill_in :search, with: "purple dog running"
    click_on 'Search'
    expect(current_path).to eq('/500')
  end
end
