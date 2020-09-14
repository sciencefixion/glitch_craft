class SearchController < ApplicationController
  def index
    conn = Faraday.get("http://localhost:9292/images/#{params[:search]}")
    json = JSON.parse(conn.body, symbolize_names: true)
    @image_options = ImageOptions.new(json)
  end

  def show
    @image = Image.find(params[:id])
  end
end
