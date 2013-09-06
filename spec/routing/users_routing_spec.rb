require "spec_helper"

describe UsersController do

  describe "routing" do
    it "routes to #new" do
      expect(get("/users/new")).to route_to("users#new")
    end

    it "routes to #urls" do
      expect(get("/urls")).to route_to("users#urls")
    end

    it "routes to #create" do
      expect(post("/users")).to route_to("users#create")
    end
  end

  describe "route helpers" do
    it "new_user_path" do
      expect(new_user_path).to eq("/users/new")
    end

    it "user_urls_path" do
      expect(user_urls_path).to eq("/urls")
    end
  end
end
