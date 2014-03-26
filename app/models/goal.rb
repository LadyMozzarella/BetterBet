class Goal < ActiveRecord::Base
  attr_accessible :title, :description, :bet_amount, :start_date, :end_date, :owner_id, :buddy_id, :terminated_at, :completed, :transfer_id
  belongs_to :owner, foreign_key: "owner_id", class_name: "User"
  belongs_to :buddy, foreign_key: "buddy_id", class_name: "User"
  validates :title, :bet_amount, :start_date, :end_date, :owner_id, presence: true

  def duration
    self.end_date - self.start_date
  end

  def time_remaining
    self.end_date - Time.now
  end

  def started?
    Time.now >= self.start_date
  end

  def countdown
    return 0 if self.time_remaining <= 0
    self.started? ? self.time_remaining : self.duration
  end

  def belongs_to(user)
    self.owner == user
  end

  def bet_in_cents
    self.bet_amount * 100
  end

  def find_recipient
    buddy = User.find(self.buddy_id)
    buddy.recipient_id
  end

  def self.expired_goal_by_user(user)
    Goal.where('owner_id = ? AND DATE(end_date) <= ? AND terminated_at IS NULL', user.id, Time.now).limit(1)
  end

  def self.expired_goal_by_buddy(buddy)
    Goal.where('buddy_id = ? AND terminated_at IS NOT NULL AND status_confirmed = false', buddy.id).limit(1)
  end
end