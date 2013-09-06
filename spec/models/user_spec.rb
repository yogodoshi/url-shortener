require 'spec_helper'

describe User do
  describe "authentication" do
    it { should have_secure_password }
  end

  describe "mass assignments" do
    context "when is allowed" do
      [:email, :password, :password_confirmation].each do |attr|
        it { should allow_mass_assignment_of(attr) }
      end
    end

    context "when its not allowed" do
      it { should_not allow_mass_assignment_of(:password_digest) }
    end
  end

  describe "validations" do
    describe "email" do
      let!(:user){ create(:user, email: "aaa@bbb.com") }
      let!(:user2){ build(:user, email: "aaa@bbb.com") }

      it "should validate uniqueness of email " do
          user2.save
          expect(user2).to validate_uniqueness_of :email
      end
    end
  end
end
