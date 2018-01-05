class UsersController < ApplicationController
  before_action :go_to_cat_index, only: [:index, :show, :edit, :update, :destroy]
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:session_token] = @user.session_token
      redirect_to user_url(@user)
    else
      flash.now[:errors] = "Your information was incorrect."
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
