class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Logado com sucesso!"
      redirect_to root_path
    else
      flash[:error] = "Senha ou email errado =/"
      render "new"
    end
  end
end
