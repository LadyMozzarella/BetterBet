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
    mail(to: @friend.email, subject: 'Welcome to BetterBet')
  end
end
