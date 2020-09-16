require 'mini_magick'
require 'pnglitch'
require 'pry'

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
      p.save 'lib/assets/glitched/new_image.png'
      image.glitched.attach(io: File.open('lib/assets/glitched/new_image.png'), filename: 'glitched.png')
    end
  end
end
