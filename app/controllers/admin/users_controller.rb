class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, except: [:index, :new, :create]
  
  def index
    @users =  User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] =  "User has been created."
      redirect_to admin_users_path
    else
      flash[:alert] = "User has failed to be created."
      render "new"
    end
  end

  def destroy
     if @user.destroy
      flash[:notice] =  "User has been deleted."
      redirect_to admin_users_path
    else
      flash[:alert] = "User has failed to be deleted."
      redirect_to admin_users_path
    end
  end

  def edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end
    if @user.update(user_params)
      flash[:notice] = "User has been updated."
      redirect_to admin_users_path
    else
      flash.now[:alert] = "User has failed to update."
      render "edit"
    end 
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
