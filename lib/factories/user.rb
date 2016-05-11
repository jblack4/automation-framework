require 'factory_girl'
require 'ostruct'

FactoryGirl.define do
  factory :user, class: OpenStruct do |f|
    f.email { Faker::Internet.email }
    f.password 'Daxko123'
  end
end
