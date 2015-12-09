class Admin::ArtistsController < Admin::ApplicationController
  before_action :set_user, except: [:index, :new, :create]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      flash[:notice] = "Artist : #{@artist} has been created."
      redirect_to admin_artists_path
    else
      flash[:alert] = "Artist : #{@artist} has failed to be created."
      render 'new'
    end
  end

  def destroy
    if @artist.destroy
      flash[:notice] = "Artist: #{@artist} has been deleted."
      redirect_to admin_artists_path
    else
      flash[:alert] = "Artist: #{@artist} has failed to be deleted."
      redirect_to admin_artists_path
    end
  end

  def edit
  end

  def update
    if @artist.update(artist_params)
      flash[:notice] = "Artist: #{@artist} has been updated."
      redirect_to admin_artists_path
    else
      flash.now[:alert] = "Artist: #{@artist} has failed to update."
      render 'edit'
    end
  end

  private

  def set_user
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :bio)
  end
end
