class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest, :bio, :picture
  has_many :goals, foreign_key: "owner_id"
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  def all_friends
    self.friends + self.inverse_friends
  end
end