class UserMailer < ApplicationMailer
    default from: 'welcome@zombo.com'

    def welcome_email(user)
        @user = user
        @url  = 'http://zombo.com/'
        mail(to: user.username, subject: 'Welcome to zombo com')
    end
end
