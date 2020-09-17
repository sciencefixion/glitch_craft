require 'rails_helper'

RSpec.describe ApiImage, type: :model do
  it {should validate_presence_of :url}
  it {should validate_presence_of :source}
  it {should belong_to :user}

  describe 'class methods' do
    it ".attach_key" do
      user = User.from_omniauth(mock_user)
      image_params = {:url => "url.com", :deep_id => "asd", :source => "source"}
      api_image = user.api_images.create!(image_params)
      key = "8e51e741-e44b-417b-9cf1-e19c7c46d4fe"
      api_image.attach_key(key)
      expect(api_image.key).to eq(key)
    end
  end
end
