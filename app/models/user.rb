class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :name, :password, :password_confirmation, :bio, :image, :stripe_id, :recipient_id
  has_many :goals, foreign_key: "owner_id"
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  validates_presence_of :name, :email, :password_digest
  validates :email, uniqueness: true
  after_save :add_to_soulmate
  before_destroy :remove_from_soulmate

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

  def latest_goal
    self.goals.where('completed = false').order("updated_at DESC").limit(1)
  end

  def is_user?(user)
    self.id == user.id
  end

  def self.search(name)
    users = Soulmate::Matcher.new("user").matches_for_term(name).tap do |collection_of_users|
      # Due to a bug in the caching algorithm of Soulmate::Matcher.matches_for_term,
      # it is possible for a user who no longer exists in OUR database to exist, cached, in
      # the Redis database.  SoulMate sucks.
      collection_of_users.select{|h| User.exists?(h["id"])}
    end
    users.collect{ |c| {"id" => c["id"], "name" => c["term"] } }
  end

  def friend_goals
    friends_info = {}
    self.friends.each do |friend|
      unless friend.goals.empty?
        friends_info[friend.name] = friend.goals.order("updated_at DESC")
      end
    end
    friends_info
  end

  def has_friend?(friend)
    self.friends.exists?(friend)
  end

  def active_goals
    self.goals.where("completed = false").order("updated_at DESC")
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
    self.goals.reject{ |goal| goal.completed? }
  end

  def has_bank_info?
    self.recipient_id
  end

  private

  def add_to_soulmate
    loader = Soulmate::Loader.new("user")
    loader.add("term" => name, "id" => self.id)
  end

  def remove_from_soulmate
    loader = Soulmate::Loader.new("user")
    loader.remove("id" => self.id)
  end

end
