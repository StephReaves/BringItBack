class User < ActiveRecord::Base
  # Remember to create a migration!
  has_secure_password

  validates :username, uniqueness: true
  validates :email, uniqueness: true

  has_many :campaigns
  has_many :comments

  has_many :votes, as: :votable

end
