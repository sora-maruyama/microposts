class UsersController < ApplicationController
  before_action :check_user, only: [:edit, :update]

  
  def new
    @user = User.new
  end
  
  def show
    @user = User.new
  end
  
  def update
    @user = User.new(user_params)
    if @user.save
    redirect_to @user
     else
      render 'show'
    end
  end

  
  def edit
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  

  
  
private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :biography, :country, :state)
  end
  # 中略
end

  def check_user
    @user = User.find(params[:id])
    if @user = current_user
    else
      redirect_to root_path
    end
  end
