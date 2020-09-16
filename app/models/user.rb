class User < ApplicationRecord
  validates :name, presence: true
  validates :uid, uniqueness: true, presence: true

  has_many :api_images, dependent: :destroy

  def self.from_omniauth(params)
    user = find_or_create_by(uid: params[:uid])
    user.name = params[:info][:name]
    user.email = params[:info][:email]
    user.avatar = params[:info][:image]
    user.access_token = params[:credentials][:token]
    user.refresh_token = params[:credentials][:refresh_token]
    user.save!
    user
  end
end
