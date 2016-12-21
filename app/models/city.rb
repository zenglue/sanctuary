class City < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :user_upvotes through: :votes, source: :user
  has_many :user_downvotes, through: :votes, source: :user
  has_many :city_vote_commments
  has_many :comments, through: :city_vote_comments

  #offical_status can only be changed by admins
  enum official_status: [:unknown, :non_sancutuary, :possible_sanctuary, :sanctuary]
  enum unofficial_status: [:non_ally, :possible_ally, :ally]

  def vote_count
    self.update(vote_count: self.upvote_count -= self.downvote_count)
  end

  def total_votes
    self.upvote_count += self.downvote_count
  end

  def set_rank
    ranking = City.order(:vote_count).pluck(:id).index(self.id)
    self.update(rank: ranking)
  end

  def set_unofficail_status
    if self.vote_count >= 1 && self.offical_status == 3
      self.update(unofficial_status: 3)
    end
  end
end
