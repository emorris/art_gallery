class Admin::GalleriesController < Admin::ApplicationController
  before_action :set_gallery, except: [:index, :new, :create]

  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      flash[:notice] = "Gallery : #{@gallery} has been created."
      redirect_to admin_galleries_path
    else
      flash[:alert] = "Gallery : #{@gallery} has failed to be created."
      render 'new'
    end
  end

  def destroy
    if @gallery.destroy
      flash[:notice] = "Gallery: #{@gallery} has been deleted."
      redirect_to admin_galleries_path
    else
      flash[:alert] = "Gallery: #{@gallery} has failed to be deleted."
      redirect_to admin_galleries_path
    end
  end

  def edit
  end

  def update
    if @gallery.update(gallery_params)
      flash[:notice] = "Gallery: #{@gallery} has been updated."
      redirect_to admin_galleries_path
    else
      flash.now[:alert] = "Gallery: #{@gallery} has failed to update."
      render 'edit'
    end
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(:name, :text)
  end
end
