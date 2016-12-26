class City < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :comments, through: :votes

  scope :sanctuary, -> {where(official_status: 3)}
  scope :possible_sanctuary, -> {where(official_status: 2)}
  scope :non_sanctuary, -> {where(official_status: 1)}
  scope :sunknown, -> {where(official_status: 0)}

  #offical_status can only be changed by admins
  enum official_status: [:unknown, :non_sancutuary, :possible_sanctuary, :sanctuary]

  #Todo: dynamic status based on vote count and type
  #[:non_ally, :contested_ally, :ally]

  def self.sanctuary
    where(official_status: 3)
  end

  def self.possible_sanctuary
    where(official_status: 2)
  end

  def self.non_sanctuary
    where(official_status: 1)
  end

  def self.unknown
    where(official_status: 0)
  end

  def update_vote_count
    self.increment!(:vote_count)
  end

  def upvote_count
    self.votes.where(vote_type: 1).count
  end

  def downvote_count
    self.votes.where(vote_type: 0).count
  end

  def vote_balance
    value = self.upvote_count - self.downvote_count
    value
  end

  def self.order_by_votes
    City.order(vote_count: :desc)
  end

  def rank_by_total_votes
    City.order(vote_count: :desc).find_index(self) + 1
  end

  #Todo: define ally conditionals
  # def set_alliance
  #   if (self.vote_count >= 1 && self.offical_status == 3) || (self.vote_count >= 1 && self.offical_status == 2)
  #     "ally"
  #   elsif self.vote_count >= 0 && self.offical_status == 3 ||
  #   end
  # end
end
