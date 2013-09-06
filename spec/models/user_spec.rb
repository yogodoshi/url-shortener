require 'spec_helper'

describe User do
  describe "authentication" do
    it { should have_secure_password }
  end
end
