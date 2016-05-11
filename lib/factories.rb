Dir["#{File.dirname(__FILE__)}/factories/*.rb"].each do |factory|
  load factory
end
