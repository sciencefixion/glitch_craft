class ImagesController < ApplicationController
  before_action :require_user
  include Glitchable
  def create
    image = current_user.api_images.create!(image_params)
    download = Down.download(image.url)
    image.original.attach(io: download, filename: "#{image.url}.jpg")
    basic_glitch(image)
    redirect_to search_show_path(image)
  end

  private

  def image_params
    params.permit(:url, :deep_id, :source, :pixabay_id)
  end
end
