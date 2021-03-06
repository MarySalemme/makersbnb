require 'bcrypt'

class User
  include DataMapper::Resource

  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, Text

  has n, :spaces

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end
end
