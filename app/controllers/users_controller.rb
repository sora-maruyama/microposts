class UsersController < ApplicationController
  before_action :auth_user, only: [:edit,:update]

  
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  # 中略
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def update
  end
  
  private
  
  def auth_user
    @user = User.find(params[:id]) #idに一致するUser
    if current_user != @user
      redirect_to root_path
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end