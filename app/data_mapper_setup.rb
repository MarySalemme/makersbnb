require 'data_mapper'
require 'dm-timestamps'
require 'dm-postgres-adapter'

require_relative 'models/user'
require_relative 'models/space'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
