require 'spec_helper'

describe Goal do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :bet_amount }
    it { should validate_presence_of :start_date }
    it { should validate_presence_of :end_date }
    it { should validate_presence_of :owner_id }
  end

  describe "associations" do
    it { should belong_to :owner  }
  end


end