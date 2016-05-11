include SignUpHelper

describe 'Attempting to sign up without a password' do
  context 'Without a password' do
    before(:all) do
      @browser.cookies.clear
      @user_no_pass = create(:user)
      @user_no_pass.password = ''
    end
    it 'Fails to create a user without a password' do
      sign_up_user(@user_no_pass)

      on SignupPage do |page|
        expect(page.error_messages).to include('Password can\'t be blank')
      end
    end
    after(:all) do
      on SignupPage do |page|
        page.home
      end
    end
  end
end
