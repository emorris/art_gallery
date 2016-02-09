class ArtistsController < ApplicationController
  def index
    render json: Artist.all
  end

  def show
    @artist = Artist.includes(:pictures).find(params[:id])
    render json: @artist, include: :pictures
  end
end
