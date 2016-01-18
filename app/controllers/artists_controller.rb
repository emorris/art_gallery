class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    render json: @artists
  end

  def show
    @artist = Artist.includes(:pictures).find(params[:id])
    render json: @artist, include: :pictures
  end
end
