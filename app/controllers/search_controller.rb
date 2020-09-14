class SearchController < ApplicationController
  before_action :require_user
  def index
    conn = Faraday.get("https://damp-forest-93176.herokuapp.com/images/#{params[:search]}")
    json = JSON.parse(conn.body, symbolize_names: true)
    @image_options = ImageOptions.new(json)
  end

  def show
    @image = Image.find(params[:id])
  end
end
