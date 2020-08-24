class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  # http://localhost:3000/rails/mailers/user_mailer/account_activation
  def account_activation(user)
    @user = user

    mail to: user.email, subject: "Starcloud Alpha Blog: Account Activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user

    mail to: user.email, subject: "Starcloud Alpha Blog: Password Reset"
  end
end
