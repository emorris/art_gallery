class Admin::ShowsController < Admin::ApplicationController
  before_action :set_show, except: [:index, :new, :create]
  before_action :set_gallery

  def index
    @shows = Show.all
  end

  def new
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    if @show.save
      flash[:notice] = 'Show has been created.'
      redirect_to admin_shows_path
    else
      flash[:alert] = 'Show has failed to be created.'
      render 'new'
    end
  end

  def destroy
    if @show.destroy
      flash[:notice] = 'User has been deleted.'
      redirect_to admin_shows_path
    else
      flash[:alert] = 'User has failed to be deleted.'
      redirect_to admin_shows_path
    end
  end

  def edit
  end

  def update
    if @show.update(show_params)
      flash[:notice] = 'User has been updated.'
      sign_in(@show, bypass: true) if @show == current_user
      redirect_to admin_shows_path
    else
      flash.now[:alert] = 'User has failed to update.'
      render 'edit'
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
    params.require(:show).permit(:email, :password)
  end
end
