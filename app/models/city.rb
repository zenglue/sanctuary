class City < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :comments, through: :votes

  scope :sanctuary, -> {where(official_status: 3)}
  scope :possible_sanctuary, -> {where(official_status: 2)}
  scope :non_sanctuary, -> {where(official_status: 1)}
  scope :unknown, -> {where(official_status: 0)}
  scope :popular_cities, -> {where("vote_balance > ?", 5)}
  default_scope {order(vote_balance: :desc, vote_count: :desc)}

  validates :name, :state, :official_status, presence: true

  #offical_status can only be changed by admins
  enum official_status: [:unknown, :non_sancutuary, :possible_sanctuary, :sanctuary]

  # def self.popular_cities
  #   City.where("vote_balance > ?", 5)
  # end


  def self.order_by_votes
    City.order(vote_count: :desc)
  end

  def upvote_count
    self.votes.where(vote_type: 1).count
  end

  def downvote_count
    self.votes.where(vote_type: 0).count
  end

  def update_vote_count
    self.increment!(:vote_count)
  end

  def vote_balance
    value = self.upvote_count - self.downvote_count
    value
  end

  def update_vote_balance
    self.update(vote_balance: self.vote_balance)
  end


  def rank_by_vote_balance_and_total_votes
    City.order(vote_balance: :desc, vote_count: :desc).find_index(self) + 1
  end
end
