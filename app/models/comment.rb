class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :campaign

  has_many :votes, as: :votable
end
