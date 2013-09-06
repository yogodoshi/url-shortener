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

  def urls
    if current_user.present?
      @urls = current_user.urls
    else
      flash[:error] = "Você precisa estar logado para acessar esta página!"
      redirect_to login_path
    end
  end
end
