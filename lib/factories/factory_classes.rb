require 'factory_girl'

class Contact
  attr_accessor :first_name, :last_name, :street, :city, :state, :postal_code, :cell_phone, :home_phone, :fax, :notes
end

class User
  attr_accessor :email, :password
end
