class ApiImage < ApplicationRecord
  validates :url, presence: true
  validates :source, presence: true

  belongs_to :user

  has_one_attached :original
end
