require 'factory_girl'
require 'ostruct'

FactoryGirl.define do
  factory :contact, class: OpenStruct do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.street { Faker::Address.street_name }
    f.city { Faker::Address.city }
    f.state { Faker::Address.state }
    f.postal_code { Faker::Address.postcode }
    f.cell_phone '(111) 111-1111'
    # TODO: BUG - Only takes limited formats
    f.home_phone '2222222222'
    # TODO: BUG - no real validation/format at all
    f.fax '(333) 333-3333'
    # TODO: BUG - Only takes limited formats
    f.notes { Faker::Lorem.sentence }
  end
end
