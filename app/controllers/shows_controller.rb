class ShowsController < ApplicationController
  def index
    
    render json: Gallery.find(params[:id]).shows_by_year
  end

  def show
     @gallery = Gallery.includes(:shows).find(params[:id])
     render json: @gallery
  end
end
