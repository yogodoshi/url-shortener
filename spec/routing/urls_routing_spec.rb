require "spec_helper"

describe UrlsController do

  describe "routing" do
    it "routes to #new" do
      expect(get("/")).to route_to("urls#new")
    end

    it "routes to #create" do
      expect(post("/urls")).to route_to("urls#create")
    end
  end

  describe "route helpers" do
    it "root_path" do
      expect(root_path).to eq("/")
    end

    it "new_url_path" do
      expect(new_url_path).to eq("/urls/new")
    end

    it "urls_path" do
      expect(urls_path).to eq("/urls")
    end
  end
end
