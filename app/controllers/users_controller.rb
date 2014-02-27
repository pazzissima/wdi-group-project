class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
  	@user = User.find(params[:id])
    # @user.clip = current_user
    #@user_clips = current_user.clips
  	# @user.send_confirmation_instructions
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to action: :show
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :avatar, :email)
  end
end
