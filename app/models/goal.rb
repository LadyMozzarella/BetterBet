class Goal < ActiveRecord::Base
  attr_accessible :title, :description, :start_date, :end_date
  belongs_to :owner, foreign_key: "owner_id", class_name: "User"
  belongs_to :buddy, foreign_key: "friend_id", class_name: "User"
  validates_presence_of :title, :bet_amount, :start_date, :end_date, :owner_id
end