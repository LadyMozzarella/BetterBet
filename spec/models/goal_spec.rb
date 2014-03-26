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
    context 'before start date' do
      it 'should return true'
    end

    context 'after start date' do
      it 'should return false'
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
    it 'sorts something?? '
  end

  describe '#bet_in_cents' do
    it 'converts the bet amount to cents'
  end

  describe '#find_recipient' do
    it 'finds the user\'s buddy\'s recipient id'
  end
end