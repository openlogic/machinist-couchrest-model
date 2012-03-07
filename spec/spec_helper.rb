$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'machinist-couchrest-model'
require 'rspec'
require "couchrest_model"

RSpec.configure do |config|
  
end

CouchRest::Model::Base.configure do |db|
  db.connection[:prefix] = 'machinist-couchrest-model'
  db.connection[:suffix] = 'test'
end
