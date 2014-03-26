require 'spec_helper'

describe Goal do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :bet_amount }
    it { should validate_presence_of :start_date }
    it { should validate_presence_of :end_date }
    it { should validate_presence_of :owner_id }
  end

  describe 'associations' do
    it { should belong_to :owner  }
  end

  describe '#duration' do
    it 'should return the difference between times'
  end

  describe '#time_remaining' do
    it 'should return the amount of time left until now'
  end

  describe '#started?' do
    describe 'before start date' do

    end

    describe 'after start date' do

    end
  end

  describe '#countdown' do

  end

  describe '#belongs_to' do

  end

  describe '#expired_goal_by_user' do

  end
end