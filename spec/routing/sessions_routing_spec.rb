require "spec_helper"

describe SessionsController do

  describe "routing" do
    it "routes to #new" do
      expect(get("/sessions/new")).to route_to("sessions#new")
    end

    it "routes to #create" do
      expect(post("/sessions")).to route_to("sessions#create")
    end
  end

  describe "route helpers" do
    it "new_session_path" do
      expect(new_session_path).to eq("/sessions/new")
    end
  end
end
