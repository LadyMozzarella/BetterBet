class Friendship < ActiveRecord::Base
  belongs_to :user, foreign_key: "user_id", class_name: "User"
  belongs_to :friend, foreign_key: "friend_id", class_name: "User"
  validates :friend_id, :user_id, presence: true
  after_create :send_new_friendship

  private
  def send_new_friendship
    UserMailer.new_friend(self.user, self.friend).deliver
  end
end