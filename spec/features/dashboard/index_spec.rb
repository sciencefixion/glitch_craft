require 'rails_helper'

RSpec.describe 'Dashboard' do
  describe 'As an authenticated of user' do
    before :each do
      # @user = User.create(name: "Glitch Witch")
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "text" do
      visit '/dashboard'
      # expect(page).to have_content("Welcome, #{@user.name}")
      fill_in :search, with: "Cats"
      expect(page).to have_button('Search')
    end
  end
end
