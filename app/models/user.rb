require 'bcrypt'

class User
  include DataMapper::Resource

  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :email, String, required: true, unique: true, format: :email_address
  property :password_digest, Text

  validates_confirmation_of :password

  def self.authenticate(email, password)
    user = first(email: email)
    return user if user && BCrypt::Password.new(user.password_digest) == password
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
