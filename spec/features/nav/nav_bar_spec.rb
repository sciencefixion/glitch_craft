require 'rails_helper'

RSpec.describe 'Nav Bar' do
  describe 'As a visitor' do
    it "should display a link for home that leads back to root path" do
      visit '/'
      within('.navbar') do
        click_on 'Home'
        expect(current_path).to eq('/')
      end
    end

    it "should display a link to login and no logout or dashboard link" do
      visit '/'
      within('.navbar') do
        expect(page).to have_link('Login')
        expect(page).to_not have_link('Logout')
      end
    end
  end

  describe 'As a logged in user' do
    before :each do
      @user = User.from_omniauth(mock_user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "should display a link for home that leads back to dashbord" do
      visit '/'
      within('.navbar') do
        click_on 'Home'
        expect(current_path).to eq('/dashboard')
      end
    end

    it "should display a logout and dashboard like and no login link" do
      visit '/'
      within('.navbar') do
        expect(page).to_not have_link('Login')
        expect(page).to have_link('Logout')
      end
    end
  end
end
