require "spec_helper"

describe UrlShortenerController do

  describe "routing" do
    it "routes to #new" do
      expect(get("/")).to route_to("url_shortener#new")
    end
  end

  describe "route helpers" do
    it "post_path" do
      expect(root_path).to eq("/")
    end
  end
end
