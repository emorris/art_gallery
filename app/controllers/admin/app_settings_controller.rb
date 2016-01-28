class Admin::AppSettingsController < Admin::ApplicationController
  def index
    @app_setting = AppSetting.instance
  end

  def update
    if AppSetting.instance.update(app_setting_params)
      flash[:notice] = "Settings have been updated."
      redirect_to admin_artists_path
    else
      flash.now[:alert] = "Settings have  failed to update."
      render :back
    end
  end

  private

  def app_setting_params
     params.require(:app_setting).permit(:about_text)
  end

end