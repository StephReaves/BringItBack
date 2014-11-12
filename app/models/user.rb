class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :campaigns
  has_many :comments

  has_many :votes, as: :votable

  has_secure_password
end
