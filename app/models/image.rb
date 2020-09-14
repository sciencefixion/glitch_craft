class Image < ApplicationRecord
  validates :url, presence: true
  validates :source, presence: true

  has_one_attached :original
end
