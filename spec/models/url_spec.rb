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
    describe "requireds" do
      it { should validate_presence_of(:original) }
    end
  end
end
