class ImagesController < ApplicationController
  def create
    image = Image.create!(image_params)
    download = Down.download(image.url)
    image.original.attach(io: download, filename: 'image.jpg')
    redirect_to search_show_path(image)
  end

  private

  def image_params
    params.permit(:url, :deep_id, :source, :pixabay_id)
  end
end
