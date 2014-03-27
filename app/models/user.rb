class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :name, :password, :password_confirmation, :bio, :image, :stripe_id, :recipient_id
  has_many :goals, foreign_key: "owner_id"
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user
  validates :name, :email, :password_digest, presence: true
  validates :email, uniqueness: true
  after_create :send_welcome

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

  def latest_goal
    Goal.latest_for(self).first
  end

  def self.search(name)
    name = name.downcase
    name = "%" + name + "%"
    find(:all, :conditions => ['lower(name) LIKE ?', name])
  end

  def friend_goals
    self.friends.includes(:goals).order("goals.updated_at DESC")
  end

  def has_friend?(friend)
    self.friends.exists?(friend)
  end

  def image=(img_path)
    return write_attribute(:image, img_path) if img_path.length > 1
    img_path = (img_path == "1") ? "http://www.gravatar.com/avatar/" + generate_md5 + "?s=300" : "/assets/default_user_image.svg"
    write_attribute(:image, img_path)
  end

  def generate_md5
    email = self.email.strip.downcase
    Digest::MD5.hexdigest(email)
  end

  def get_buddies
    self.friends.select{ |friend| friend.recipient_id }
  end

  def incomplete_goals
    self.goals.where("completed = false").order("updated_at DESC")
  end

  def has_bank_info?
    self.recipient_id
  end

  def send_welcome
    UserMailer.welcome_email(self).deliver
  end

end
