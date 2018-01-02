class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: 200
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 200
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render json: @user, status: 200
    else
      render plain: "Could not find user", status: 404
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user
      @user.update(user_params)
      render json: @user, status: 200
    else
      render plain: "Could not find user", status: 404
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user
      @user.destroy
      redirect_to users_url, status: 200
    else
      render plain: "Could not destroy user", status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email)
  end
end
