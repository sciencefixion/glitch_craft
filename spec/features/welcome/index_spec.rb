require 'rails_helper'

RSpec.describe 'Welcome Index' do
  describe 'As a visitor' do
    it 'displays a welcome index page' do
      visit root_path
      expect(page).to have_link('Login')
      expect(page).to have_link('GlitchCraft')
      expect(current_path).to eq(root_path)
    end

    it "loads a welcome index" do
      visit root_path
      expect(page).to have_content('GlitchCraft')
      within ('.description') do
        expect(page).to have_content('This app allows you to glitch a photo. You can chose from an AI generated photo or a human one and corrupt its file using our app!. Come discover your databending powers!')
      end
      expect(page).to have_link('Login with Google to Start Glitching')
    end
  end
end
