require 'spec_helper'

describe Url do
  describe "mass assignment" do
    context "when is allowed" do
      it { should allow_mass_assignment_of(:original) }
    end

    context "when is not allowed" do
      [:shortened, :user_id].each do |attr|
        it { should_not allow_mass_assignment_of(attr) }
      end
    end
  end

  describe "validation" do
    describe "required" do
      it { should validate_presence_of(:original) }
    end
  end

  describe "callbacks" do
    describe "before_validation"do
      describe "#shorten_url" do
        let!(:url) do
          build(:url, original: "http://globoesporte.globo.com/futebol/times/goias/noticia/2013/09/belfort-diz-que-pode-ajudar-walter-emagrecer-perco-11kg-em-dois-dias.html")
        end

        it "should set a random string on shortened field" do
          expect do
            url.save!
          end.to change{ url.shortened }.from(nil).to(/[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]/)
        end

        it "should never break after creating thousands of random shortened URLs" do
          2000.times do #make it 50000 and it will only take longer to run the tests ;D
            FactoryGirl.create(:url)
          end
        end
      end
    end
  end
end
