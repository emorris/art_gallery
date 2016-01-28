class AppSettingsController < ApplicationController
  def index
    
    render json: AppSetting.instance
  end
end
