require "spec_helper"

describe UrlsController do

  describe "routing" do
    it "routes to #new" do
      expect(get("/")).to route_to("urls#new")
    end

    it "routes to #create" do
      expect(post("/urls")).to route_to("urls#create")
    end

    it "routes to #unshorten" do
      expect(get("/1234")).to route_to("urls#unshorten", id: "1234")
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

    it "unshorten_url_path" do
      expect(unshorten_url_path("1234")).to eq("/1234")
    end
  end
end
