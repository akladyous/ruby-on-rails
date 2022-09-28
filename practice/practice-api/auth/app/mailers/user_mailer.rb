class UserMailer < ApplicationMailer

    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.user_mailer.welcome_msg.subject
    #
    def welcome_msg
        @user = params[:user]
        mail to: @user.email, subject: 'Account registration'
    end
end
