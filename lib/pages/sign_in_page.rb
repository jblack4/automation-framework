class SigninPage
  include PageObject

  page_url 'http://ec2-54-191-181-182.us-west-2.compute.amazonaws.com/users/sign_in'

  link(:sign_up, text: 'Sign up')
  link(:forgot_password, text: 'Forgot your password?')
  text_field(:email, id: 'user_email')
  text_field(:password, id: 'user_password')
  button(:submit, id: 'user_submit')
  div(:error_message, class: 'form-error-main')

  def login(params = {})
    email_element.when_present
    self.email = params[:email] || 'test@test.com'
    self.password = params[:password] || '123456'
    submit
  end
end
