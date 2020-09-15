require 'rails_helper'

RSpec.describe 'Restrcitions' do
  describe 'As a visitor' do
    it "renders 404 when visiting any page other than welcome page" do
      visit '/dashboard'
      expect(page).to have_content("Page not Found")

      visit '/search'
      expect(page).to have_content("Page not Found")
    end
  end
end
