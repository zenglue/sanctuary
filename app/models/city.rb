class City < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes
  has_many :city_vote_commments
  has_many :comments, through: :city_vote_comments

  #offical_status can only be changed by admins
  enum official_status: [:unknown, :non_sancutuary, :possible_sanctuary, :sanctuary]
  enum unofficial_status: [:unknown, :non_sancutuary, :possible_sanctuary, :sanctuary]

  def vote_count
    self.update(vote_count: self.upvote_count -= self.downvote_count)
  end

  def set_rank
    ranking = City.order(:vote_count).pluck(:id).index(self.id)
    self.update(rank: ranking)
    end
  end
end
