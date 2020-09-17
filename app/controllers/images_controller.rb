require 'aws-sdk-s3'

class ImagesController < ApplicationController
  before_action :require_user
  include Glitchable
  def create
    credentials = Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
    connection = Aws::S3::Client.new(region: 'us-east-1', credentials: credentials)
    image = current_user.api_images.create!(image_params)
    download = Down.download(image.url)
    image.original.attach(io: download, filename: 'image.jpg')
    basic_glitch(image)
    File.open('lib/assets/glitched/new_image.png', 'rb') do |file|
      connection.put_object(bucket: 'glitch-craft-images', key: 'image-key', body: file)
    end

    redirect_to search_show_path(image)
  end

  private

  def image_params
    params.permit(:url, :deep_id, :source, :pixabay_id)
  end
end
