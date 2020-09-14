class SearchController < ApplicationController
  def index
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
  end

  def show
    @image = Image.find(params[:id])
  end
end
