require 'spec_helper'

describe ApplicationHelper do
  context '#format_days' do
    it 'should return an integer' do
      expect(helper.format_days(86400)).to eq 1
    end
  end

  context '#format_date' do
    it 'should return a formatted date' do
      expect(helper.format_date(Time.now)).to be_a(String)
    end
  end
end