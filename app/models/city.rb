class City < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes
  has_many :city_vote_commments
  has_many :comments, through: :city_vote_comments

  enum official_status: [:non_sancutuary, :possible_sanctuary, :sanctuary]
  enum unofficial_status: [:unknown, :non_sancutuary, :possible_sanctuary, :sanctuary]

  def vote_count
    self.upvote_count -= self.downvote_count
  end

  def rank
    City.all.each do |city|



end
