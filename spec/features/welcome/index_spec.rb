require 'rails_helper'

RSpec.describe 'Welcome Index' do
  it 'displays a welcome index page' do
    visit root_path
    expect(page).to have_content('Welcome')
  end
end
