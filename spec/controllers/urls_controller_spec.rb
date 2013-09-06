require 'spec_helper'

describe UrlsController do
  describe "GET 'new'" do
    before do
      get :new
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should render_with_layout(:application) }

    it "should assign a new url" do
      expect(assigns(:url)).to be_a(Url)
    end
  end

  describe "POST 'create'" do
    context "with valid params" do
      let(:params) do
        {
          url: {
            original: "http://www.globo.com"
          }
        }
      end

      it "should assign @url with a Url" do
        post :create, params
        expect(assigns(:url)).to be_a(Url)
      end

      it "should redirect to root_path" do
        post :create, params
        should redirect_to(root_path)
      end

      it "should set the flash correctly" do
        post :create, params
        should set_the_flash[:success].to(/URL encurtada com sucesso, olha só: http:\/\/test\.host\/#{assigns(:url).shortened}/)
      end

      it "should assign @url to no user" do
        post :create, params
        expect(assigns(:url).reload.user_id).to eq(nil)
      end

      context "logged in" do
        let!(:user){ create(:user) }

        before do
          session[:user_id] = user.id
        end

        it "should assign @url with a the logged in user" do
          post :create, params
          expect(assigns(:url).reload.user_id).to eq(user.id)
        end
      end
    end

    context "with invalid params" do
      let(:params) do
        {
          url: {
            original: ""
          }
        }
      end

      it "should assign @url with a Url" do
        post :create, params
        expect(assigns(:url)).to be_a(Url)
      end

      it "should re-render the 'new' template" do
        post :create, params
        should render_template("new")
      end
    end
  end

  describe "GET 'unshorten'" do

    context "with a valid param" do

      let!(:url) do
        create(:url, original: "http://estoujogando.com.br/atividades")
      end

      before do
        get :unshorten, id: url.shortened
      end

      it { should respond_with(301) }
      it { should_not render_template(:unshorten) }
      it { should_not render_with_layout(:application) }

      it "should redirect to the original url" do
        should redirect_to("http://estoujogando.com.br/atividades")
      end
    end

    context "with an invalid param" do
      it "should raise error" do
        expect do
          get :unshorten, id: "aa"
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
