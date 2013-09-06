require 'spec_helper'

describe UsersController do
  describe "GET 'new'" do
    before do
      get :new
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should render_with_layout(:application) }

    it "should assign a new user" do
      expect(assigns(:user)).to be_a(User)
    end
  end
end
