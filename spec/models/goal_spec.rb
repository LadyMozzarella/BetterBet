require 'spec_helper'

describe Goal do
  let!(:goal) { create :goal }
  let!(:user) { create :user, recipient_id: 1 }

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
      it 'should return 0' do
        goal.stub(:time_remaining).and_return(-1)
        expect(goal.countdown).to be 0
      end
    end

    context 'if during the goal time remaining' do
      it 'should return the time remaining' do
        goal.stub(:started?).and_return(true)
        goal.stub(:time_remaining).and_return(1)
        expect(goal.countdown).to be 1
      end
    end

    context 'if before the goal is started' do
      it 'should return the goal length' do
        goal.stub(:started?).and_return(false)
        goal.stub(:duration).and_return(1)
        expect(goal.countdown).to be 1
      end
    end
  end

  describe '#belongs_to' do
    context 'if user is the owner of the goal' do
      it 'should return true' do
        goal.stub(:owner).and_return(user)
        expect(goal.belongs_to(user)).to eq true
      end
    end

    context 'if user isn\'t the owner of the goal' do
      it 'should return false' do
        goal.stub(:owner).and_return(create :user)
        expect(goal.belongs_to(user)).to eq false
      end
    end
  end

  describe '#bet_in_cents' do
    it 'converts the bet amount to cents' do
      goal.stub(:bet_amount).and_return(1)
      expect(goal.bet_in_cents).to be 100
    end
  end

  describe '#find_recipient' do
    it 'should find recipient' do
      goal.stub(:buddy_id).and_return(user.id)
      expect(goal.find_recipient).to eq "1"
    end
  end

  describe '#expired_goal_by_user' do
    let!(:goal) { create_list(:goal, 1, owner_id: user.id, end_date: "2013-01-01 00:00:01 -0600") }

    it 'should show an expired and status unconfirmed goal' do
      Time.stub(:now).and_return(Time.parse("2013-02-01 00:00:01 -0600"))
      expect(Goal.expired_goal_by_user(user)).to eq goal
    end
  end

  describe '#expired_goal_by_buddy' do
    let!(:goal) { create_list(:goal, 1, buddy_id: user.id, terminated_at: "2013-01-01 00:00:01 -0600", status_confirmed: false) }
    it 'should show an expired and status unconfirmed goal' do
      expect(Goal.expired_goal_by_buddy(user)).to eq goal
    end
  end
end