class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Pronto, agora você está logado!"
      redirect_to root_path
    else
      render "new"
    end
  end
end
