class Admin::PicturesController < Admin::ApplicationController
  before_action :set_picture
  def destroy
    if @picture.destroy
      flash[:notice] = 'Picture has been deleted.'
      redirect_to :back
    else
      flash[:alert] = 'Picture has failed to be deleted.'
      redirect_to :back
    end
  end

  private
  
  def set_picture
    @picture = Picture.find(params[:id])
  end
end