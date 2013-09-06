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

  describe "POST 'create'" do
    context "with valid params" do
      let(:params) do
        {
          user: {
            email: "email@avassalador.com",
            password: "1234",
            password_confirmation: "1234"
          }
        }
      end

      it "should assign @user with a User" do
        post :create, params
        expect(assigns(:user)).to be_a(User)
      end

      it "should redirect to root_path" do
        post :create, params
        should redirect_to(root_path)
      end

      it "should set the flash correctly" do
        post :create, params
        should set_the_flash[:success].to("Pronto, agora você está logado!")
      end

      it "should set the session" do
        expect do
          post :create, params
        end.to change{ session[:user_id] }.from(nil)
      end
    end

    context "with invalid params" do
      let(:params) do
        {
          user: {
            email: "email@aindacerto.com"
          }
        }
      end

      it "should assign @user with a User" do
        post :create, params
        expect(assigns(:user)).to be_a(User)
      end

      it "should re-render the 'new' template" do
        post :create, params
        should render_template("new")
      end

      it "should not create a new user" do
        expect do
          post :create, params
        end.to_not change{ User.count }
      end
    end
  end


  describe "GET 'urls'" do
    context "user logged in" do
      let!(:user){ create(:user) }
      let!(:another_user){ create(:user) }
      let!(:url1){ create(:url, user: user) }
      let!(:url2){ create(:url, user: user) }
      let!(:another_user_url){ create(:url, user: another_user) }

      before do
        session[:user_id] = user.id
        get :urls
      end

      describe "common" do
        it { should respond_with(:success) }
        it { should render_template(:urls) }
        it { should render_with_layout(:application) }
      end

      it "should assign @urls with the logged user urls" do
        expect(assigns(:urls)).to include(url1)
        expect(assigns(:urls)).to include(url2)
        expect(assigns(:urls)).to_not include(another_user_url)
      end
    end

    context "user not logged in" do
      it "should redirect to login_path" do
        get :urls
        should redirect_to(login_path)
      end

      it "should set the flash correctly" do
        get :urls
        should set_the_flash[:error].to("Você precisa estar logado para acessar esta página!")
      end
    end
  end
end
