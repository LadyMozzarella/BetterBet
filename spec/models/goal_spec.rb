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
    let!(:goal) { create :goal, start_date: "2020-11-19 08:22:21 -0600", end_date: "2020-11-19 08:22:22 -0600" }

    it 'should return the difference between times' do
      expect(goal.duration.to_i).to be 1
    end
  end

  describe '#time_remaining' do
    let!(:goal) { create :goal, end_date: "2020-11-20 08:22:01 -0600" }
    it 'should return the amount of time left until now' do
      Time.stub(:now).and_return(Time.parse("2020-11-20 08:22:00 -0600"))
      expect(goal.time_remaining.to_i).to be 1
    end
  end

  describe '#started?' do
    let!(:goal) { create :goal, start_date: "2013-01-31 00:00:01 -0600" }

    context 'before start date' do
      it 'should return false' do
        Time.stub(:now).and_return(Time.parse("2013-01-30 00:00:01 -0600"))
        expect(goal.started?).to eq false
      end
    end

    context 'after start date' do
      it 'should return true' do
        Time.stub(:now).and_return(Time.parse("2013-02-01 00:00:01 -0600"))
        expect(goal.started?).to eq true
      end
    end
  end

  describe '#countdown' do
    context 'if no time remaining' do
      it 'should return 0'
    end

    context 'if during the goal time remaining' do
      it 'should return the time remaining'
    end

    context 'if after the goal is completed' do
      it 'should return the goal length'
    end
  end

  describe '#belongs_to' do
    context 'if user is itself' do
      it 'should return true'
    end

    context 'if user isn\t itself' do
      it 'should return false'
    end
  end

  describe '#expired_goal_by_user' do
    it 'should show an expired and status unconfirmed goal'
  end

  describe '#bet_in_cents' do
    it 'converts the bet amount to cents'
  end

  describe '#find_recipient' do
    it 'finds the user\'s buddy\'s recipient id'
  end
end