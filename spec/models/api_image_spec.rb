require 'rails_helper'

RSpec.describe ApiImage, type: :model do
  it {should validate_presence_of :url}
  it {should validate_presence_of :source}
  it {should belong_to :user}
end
