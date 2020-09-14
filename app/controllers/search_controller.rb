class SearchController < ApplicationController
  before_action :require_user
  def index
<<<<<<< HEAD
    search = params[:search].split.join('+')
    if search.match('[a-zA-Z]+')
      conn = Faraday.get("https://damp-forest-93176.herokuapp.com/images/#{search}")
      if conn.status == 500
        redirect_to '/500'
      elsif conn.status == 200
        json = JSON.parse(conn.body, symbolize_names: true)
        @image_options = ImageOptions.new(json)
      end
    else
      redirect_to '/400'
    end
=======
    conn = Faraday.get("https://damp-forest-93176.herokuapp.com/images/#{params[:search]}")
    json = JSON.parse(conn.body, symbolize_names: true)
    @image_options = ImageOptions.new(json)
>>>>>>> master
  end

  def show
    @image = Image.find(params[:id])
  end
end
