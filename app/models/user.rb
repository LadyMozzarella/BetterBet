class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest, :bio, :picture
  has_many :goals, foreign_key: "owner_id"
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  validates_presence_of :name, :email, :password_digest

  def all_friends
    self.friends + self.inverse_friends
  end

  def self.omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.image = auth.info.image
        user.token = auth.credentials.token
        user.expires_at = Time.at(auth.credentials.expires_at)
        user.save!
    end
  end
end