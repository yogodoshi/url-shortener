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
end
