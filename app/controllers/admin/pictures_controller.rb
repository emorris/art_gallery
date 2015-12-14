class Admin::PicturesController < Admin::ApplicationController
  before_action :set_picture
  def destroy
    if @picture.destroy
      render json: @picture
    else
      render json: { errors: @picture.errors.full_messages }, status: 422
    end
  end

  private
  
  def set_picture
    @picture = Picture.find(params[:id])
  end
end