class ShowsController < ApplicationController
  def index
    
    render json: Gallery.find(params[:gallery_id]).shows_by_year
  end

  def show
    @show = Gallery.find(params[:gallery_id]).shows.find(params[:id])
    render json: @show
  end
end
