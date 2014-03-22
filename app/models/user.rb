class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :name, :password, :password_confirmation, :bio, :image
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
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.image = auth.info.image
      user.token = auth.credentials.token
      user.expires_at = Time.at(auth.credentials.expires_at)
      user.password_digest = auth.uid
      user.save!
    end
  end

  def has_friends?
    (self.friends + self.inverse_friends).length > 0
  end

  def is_current_user?(current_user)
    self.id != current_user.id
  end
end