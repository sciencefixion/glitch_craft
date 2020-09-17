require 'rails_helper'

RSpec.describe 'Seach show page' do
  describe 'as a user' do
    before :each do
      user = User.from_omniauth(mock_user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit dashboard_path
      fill_in :search, with: "Cat"
      click_on 'Search'
      click_on 'Glitch this Pixabay image'
      @image = ApiImage.last
    end
    it 'allows download of glitched image with a button' do

      click_on 'Download'
      expect(current_path).to eq(download_path)
      expect(response).to be_successful
    end
  end
end
