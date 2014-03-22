class Goal < ActiveRecord::Base
  attr_accessible :title, :description, :bet_amount, :start_date, :end_date, :owner_id, :buddy_id
  belongs_to :owner, foreign_key: "owner_id", class_name: "User"
  belongs_to :buddy, foreign_key: "friend_id", class_name: "User"
  validates_presence_of :title, :bet_amount, :start_date, :end_date, :owner_id

  def time_left
    self.end_date - self.start_date
  end
end