require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :uid }
    it { should validate_uniqueness_of :uid }
    it { should have_many :api_images }
  end

  describe 'Class Methods' do
    it ".from_omniauth" do
      expect(User.count).to eq(0)
      user_data = mock_user
      User.from_omniauth(user_data)
      expect(User.count).to eq(1)
    end
  end
end
