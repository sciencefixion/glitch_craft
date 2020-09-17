require 'mini_magick'
require 'pnglitch'
require 'pry'
require 'aws-sdk-s3'

module Glitchable
  def convert_to_png(image)
    target = MiniMagick::Image.open(image.url)
    target.format 'png'
  end

  def basic_glitch(image)
    target = convert_to_png(image)
    PNGlitch.open(target.path) do |p|
      p.glitch do |data|
        data.gsub(/\d/, 'x')
      end
      p.save ENV['PICTURE_PATH']
      image.glitched.attach(io: File.open(ENV['PICTURE_PATH']), filename: "#{image.deep_id || image.pixabay_id}.png")
    end
  end
end
