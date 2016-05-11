Dir["#{File.dirname(__FILE__)}/helpers/**/*_helper.rb"].each do |helper|
  load helper
end
