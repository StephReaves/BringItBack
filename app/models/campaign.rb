class Campaign < ActiveRecord::Base
  # Remember to create a migration!
  has_many :comments

  has_many :votes, as: :votable

  belongs_to :user

end
