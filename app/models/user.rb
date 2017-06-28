class User
  include DataMapper::Resource

  has n, :links, through: Resource
  has n, :tags, through: Resource

  property :id, Serial
  property :email, String
  property :password, String
end
