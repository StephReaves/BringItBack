class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :campaign

  has_many :votes, as: :votable

  def vote(user)
    if self.votes.find_by(votable: user.id)
      return false
    else
      self.votes << Vote.create(votable: user)
      return true
    end
  end

  def score
    self.votes.size
  end

end
