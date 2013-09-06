require "spec_helper"

describe UsersController do

  describe "routing" do
    it "routes to #new" do
      expect(get("/users/new")).to route_to("users#new")
    end

    it "routes to #create" do
      expect(post("/users")).to route_to("users#create")
    end
  end

  describe "route helpers" do
    it "new_user_path" do
      expect(new_user_path).to eq("/users/new")
    end
  end
end
