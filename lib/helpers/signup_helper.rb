require_relative '../../spec/spec_helper'

module SignUpHelper
  def sign_up_user(user)
    visit HomePage do |page|
      page.my_account
    end

    on SigninPage do |page|
      page.sign_up
    end

    on SignupPage do |page|
      page.input_user_details(
        email:    user.email,
        password: user.password
      )
    end
  end
end
