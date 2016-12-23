class Vote < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_one :comment, inverse_of
  enum vote_type: [:downvote, :upvote]
  validates :city_id, presence: true
  validates :user_id, presence: true, unless:

  def not_yet_voted?
    self()

end
