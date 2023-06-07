class UsersController < ApplicationController

before_action :authenticate_user!, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Profile created successfully."
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path, notice: "Profile updated successfully."
    else
      render :edit
    end
  end

  def logout
    sign_out(current_user)
    redirect_to root_path, notice: "Logged out successfully."
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :date_of_birth, :address, :phone, :health_insurance, :email, :password, :password_confirmation)
  end
end
