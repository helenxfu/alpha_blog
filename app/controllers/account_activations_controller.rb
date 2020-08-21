class AccountActivationsController < ApplicationController
  def edit_account_activation_url(@user.activation_token, email: @user.email)
  end
end
