require 'spec_helper'

describe UrlShortenerController do

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
end
