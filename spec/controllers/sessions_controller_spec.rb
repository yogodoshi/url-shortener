require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    before do
      get :new
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should render_with_layout(:application) }
  end


  describe "POST 'create'" do
    let!(:user) { create(:user, email: "contato@dobom.com", password: "1234", password_confirmation: "1234") }

    context "with valid params" do
      let(:params) do
        {
          email: "contato@dobom.com",
          password: "1234"
        }
      end

      it "should redirect to root_path" do
        post :create, params
        should redirect_to(root_path)
      end

      it "should set the flash correctly" do
        post :create, params
        should set_the_flash[:success].to("Logado com sucesso!")
      end

      it "should set the session" do
        expect do
          post :create, params
        end.to change{ session[:user_id] }.from(nil).to(user.id)
      end
    end

    context "with invalid params" do
      let(:params) do
        { email: "contato@dobom.com" }
      end

      it "should set the flash correctly" do
        post :create, params
        should set_the_flash[:error].to("Senha ou email errado =/")
      end

      it "should re-render the 'new' template" do
        post :create, params
        should render_template("new")
      end
    end
  end


  describe "DELETE 'destroy'" do
    context "user was logged in" do
      before do
        session[:user_id] = "1234"
      end

      it "should unset the session" do
        expect do
          delete :destroy
        end.to change{ session[:user_id] }.from("1234").to(nil)
      end

      it "should redirect to root_path" do
        delete :destroy
        should redirect_to(root_path)
      end
    end

    context "user wasnt logged in" do

    end
  end
end
