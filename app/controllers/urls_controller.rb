class UrlsController < ApplicationController

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(params[:url])

    if @url.save
      flash[:success] = "URL encurtada com sucesso, olha só: #{request.base_url + "/" + @url.shortened}"
      redirect_to root_path
    else
      render 'new'
    end
  end
end
