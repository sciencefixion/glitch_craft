class SearchController < ApplicationController
  before_action :require_user
  def index
    search = params[:search].split.join('+')
    if search.match('[a-zA-Z]+')
      conn = Faraday.get("https://damp-forest-93176.herokuapp.com/images/#{search}")
      get_image_options(conn)
    else
      redirect_to '/400'
    end
  end

  def show
    @image = ApiImage.find(params[:id])
  end

  private

  def get_image_options(conn)
    if conn.status == 500
      redirect_to '/500'
    elsif conn.status == 200
      json = JSON.parse(conn.body, symbolize_names: true)
      @image_options = ImageOptions.new(json)
    end
  end
end
