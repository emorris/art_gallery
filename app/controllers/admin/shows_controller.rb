class Admin::ShowsController < Admin::ApplicationController
  before_action :set_show, except: [:index, :new, :create]
  before_action :set_gallery

  def index
    @shows = @gallery.shows
  end

  def new
    @show = @gallery.shows.build
  end

  def create
    @show = @gallery.shows.create(show_params)
    @show.attributes = show_params
    if @show.save
      @gallery.shows << @show
      flash[:notice] = 'Show has been created.'
      redirect_to admin_gallery_shows_path(@gallery)
    else
      flash[:alert] = 'Show has failed to be created.'
      render :back
    end
  end

  def destroy
    if @show.destroy
      flash[:notice] = 'User has been deleted.'
      redirect_to admin_gallery_shows_path(@gallery)
    else
      flash[:alert] = 'User has failed to be deleted.'
      redirect_to :back
    end
  end

  def edit
  end

  def update
    if @show.update(show_params)
      flash[:notice] = 'User has been updated.'
      sign_in(@show, bypass: true) if @show == current_user
      redirect_to admin_gallery_shows_path(@gallery)
    else
      flash.now[:alert] = 'User has failed to update.'
      render :back
    end

  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end
  
  def set_show
    @show = Show.find(params[:id])
  end

  def show_params
    params.require(:show).permit(
      :title,
      :artists,
      :start_date,
      :end_date,
      :visible,
      :reception_start,
      :reception_end,
      :text
    )
  end
end
