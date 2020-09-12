class SearchController < ApplicationController
  def show
    conn = Faraday.get("http://localhost:9292/images/#{params[:search]}")
  end
end
