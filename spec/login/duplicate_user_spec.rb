include SignUpHelper

describe 'Attempting to create a duplicate user' do
  context 'With an already used email' do
    before(:all) do
      @user = create(:user)
      @browser.cookies.clear
      sign_up_user(@user)
    end

    it 'Fails to create a duplicate user' do
      on SignupPage do |sign_up|
        @browser.cookies.clear
        sign_up.home
        sign_up_user(@user)
        expect(sign_up.error_messages).to include('Email has already been taken')
      end
    end

    after(:all) do
      visit SigninPage do |sign_in|
        sign_in.login(email: @user.email, password: @user.password)
      end
      visit EditUserPage do |edit_user|
        edit_user.cancel_and_confirm
      end
    end
  end
end
