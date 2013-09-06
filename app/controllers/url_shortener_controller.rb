class UrlShortenerController < ApplicationController

  def new
    @url = Url.new
  end
end
