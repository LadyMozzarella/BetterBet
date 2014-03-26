class UserMailer < ActionMailer::Base
  default from: "betterbetapp@gmail.com"
   def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Welcome to BetterBet')
  end

   def new_friend(user, friend)
    @user = user
    @friend = friend
    @url  = 'http://localhost:3000/login'
    mail(to: @friend.email, subject: 'New Friend at BetterBet')
  end

  def goal_end_email(friend, user, goal)
    @friend = friend
    @user = user
    @goal = goal
    @url  = 'http://localhost:3000/login'
    mail(to: @friend.email, subject: 'Goal Complete BetterBet')
  end
end
