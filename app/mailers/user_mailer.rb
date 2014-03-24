class UserMailer < ActionMailer::Base
  DEFAULT_EMAIL = "betterbetapp@gmail.com"

  default from: DEFAULT_EMAIL
   def welcome_email(user)
    @user = user
    @url  = "#{Rails.root}/login"
    mail(to: @user.email, subject: 'Welcome to BetterBet')
  end

   def new_friend(user, friend)
    @user = user
    @friend = friend
    @url  = "#{Rails.root}/login" #find out how to get root path from Rails
    mail(to: @friend.email, subject: 'Welcome to BetterBet')
  end
end
