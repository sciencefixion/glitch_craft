class ApiImage < ApplicationRecord
  validates :url, presence: true
  validates :source, presence: true

  belongs_to :user

  has_one_attached :original
  has_one_attached :glitched

  def attach_key(key)
    self.key = key
  end
end
