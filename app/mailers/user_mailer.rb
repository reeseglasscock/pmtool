class UserMailer < ApplicationMailer
  default from: 'reese@teamsuitemanager‍.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'https://teamsuitemanager.com/sign_in'
    mail(to: user.email, subject: 'Welcome to PM Tool!')
  end
end
