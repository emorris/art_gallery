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
    if @artist.picture_save(artist_params)
      flash[:notice] = "Artist: #{@artist} has been updated."
      redirect_to admin_artists_path
    else
      flash.now[:alert] = "Artist: #{@artist} has failed to update."
      render 'edit'
    end
  end

  def upload_picture
    params[:artist][:pictures_attributes]['0'][:sort] = @artist.pictures.count
    if @artist.update(artist_params)
      render json: @artist.pictures.last
    else
      render json: { errors: @artist.errors.full_messages }, status: 422
    end
  end

  private

  def set_user
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:id, :name, :bio, pictures_attributes: [:image_file, :text, :id, :sort])
  end
end
