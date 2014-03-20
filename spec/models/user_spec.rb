require 'spec_helper'

describe User do
  context "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
    it { should validate_presence_of :password_digest }
  end

  context "associations" do
    it { should have_many(:friendships) }
    it { should have_many(:goals) }
  end
end