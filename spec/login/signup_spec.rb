include SignUpHelper

describe 'Create account' do
  before(:all) do
    @user = create(:user)
    puts @user.email
    puts @user.password
  end

  context 'free plan' do
    it 'currently signed in' do
      sign_up_user(@user)

      on SignupPage do |page|
        page.home
      end
      on HomePage do |page|
        expect(page.content_div).to include("Currently sign in as #{@user.email}")
      end
    end
  end

  after(:all) do
    visit EditUserPage do |page|
      page.cancel_and_confirm
    end
  end
end
