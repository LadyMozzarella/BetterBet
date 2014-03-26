class UserMailer < ActionMailer::Base
  DEFAULT_EMAIL = "betterbetapp@gmail.com"
  
  default from: "betterbetapp@gmail.com"
   def welcome_email(user)
    @user = user
    @url  = user_url(@user.id)
    mail(to: @user.email, subject: 'Welcome to BetterBet')
  end

   def new_friend(user, friend)
    @user = user
    @friend = friend
    @url  = login_url
    mail(to: @friend.email, subject: 'New Friend at BetterBet')
  end

  def goal_end_email(friend, user, goal)
    @friend = friend
    @user = user
    @goal = goal
    @url  = login_url
    mail(to: @friend.email, subject: 'Goal Complete BetterBet')
  end
end
