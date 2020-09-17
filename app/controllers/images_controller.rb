class ImagesController < ApplicationController
  before_action :require_user
  include Glitchable
  include S3able

  def create
    api_image = current_user.api_images.create!(image_params)
    download = Down.download(api_image.url)
    api_image.original.attach(io: download, filename: "#{api_image.url}.jpg")
    basic_glitch(api_image)
    api_image.attach_key(upload_image)
    api_image.save
    redirect_to search_show_path(api_image)
  end

  private

  def image_params
    params.permit(:url, :deep_id, :source, :pixabay_id)
  end
end
