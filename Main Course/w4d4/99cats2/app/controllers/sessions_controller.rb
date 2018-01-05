class SessionsController < ApplicationController
  before_action :go_to_cat_index, only: [:index, :show, :edit, :update, :destroy]
  def new
    @user = User.new
    render :new
  end



  def create
    @user = User.find_by_credentials(params[:session][:user_name], params[:session][:password])
    if @user
      @session_token = Session.new(user_id: @user.id)
      fail
      @session_token.save!
      session[:session_token] = @session_token.session_token
      redirect_to cats_url
    else
      @user = User.new
      @user.user_name = params[:user_name]
      flash.now[:errors] = "Could not find user"
      render :new
    end
  end

  def destroy
     if current_user
       current_user.reset_session_token!
       session[:session_token] = nil
       redirect_to new_session_url
     end
  end
end
