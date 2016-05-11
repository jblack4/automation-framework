$LOAD_PATH << File.dirname(__FILE__) + '/../lib'

require 'rspec'
require 'watir-webdriver'
require 'page-object'
require 'page-object/page_factory'
require 'faker'
require 'pages'
require 'factories'
require 'helpers'
require 'factory_girl'
require_relative 'support/factory_girl'

browser = Watir::Browser.new :firefox
browser.window.maximize

RSpec.configure do |config|
  config.include PageObject::PageFactory
  config.include FactoryGirl
  config.include FactoryGirl::Syntax::Methods
  config.before(:all) { @browser = browser }
  config.after(:suite) { browser.close }
end
