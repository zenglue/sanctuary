class City < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :user_upvotes, through: :votes, source: :user
  has_many :user_downvotes, through: :votes, source: :user
  has_many :city_vote_commments
  has_many :comments, through: :city_vote_comments

  #offical_status can only be changed by admins
  enum official_status: [:unknown, :non_sancutuary, :possible_sanctuary, :sanctuary]
  #Todo:
  # enum unofficial_status: [:non_ally, :contested_ally, :ally]

  def vote_count
    self.update(vote_count: self.upvote_count -= self.downvote_count)
  end

  def upvote_count
    self.votes.count.where(type: 1)
  end

  def downvote_count
    self.votes.count.where(type: 0)
  end

  def total_votes
    total = self.upvote_count += self.downvote_count
    total
  end

  def set_rank
    ranking = City.order(:vote_count).pluck(:id).index(self.id)
    self.update(rank: ranking)
  end

  #Todo: define ally conditionals
  # def set_alliance
  #   if (self.vote_count >= 1 && self.offical_status == 3) || (self.vote_count >= 1 && self.offical_status == 2)
  #     self.update(unofficial_status: 3)
  #   elsif self.vote_count >= 0 && self.offical_status == 3 ||
  #   end
  # end
end
