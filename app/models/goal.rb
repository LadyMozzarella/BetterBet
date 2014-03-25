class Goal < ActiveRecord::Base
  attr_accessible :title, :description, :bet_amount, :start_date, :end_date, :owner_id, :buddy_id, :terminated_at, :completed
  belongs_to :owner, foreign_key: "owner_id", class_name: "User"
  belongs_to :buddy, foreign_key: "buddy_id", class_name: "User"
  validates_presence_of :title, :bet_amount, :start_date, :end_date, :owner_id

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

  def self.expired_goal_by_user(user)
    Goal.where('owner_id = ? AND DATE(end_date) <= ? ', user.id, Time.now).limit(1)
  end

end