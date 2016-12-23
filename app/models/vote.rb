class Vote < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_one :comment, inverse_of: :vote
  enum vote_type: [:downvote, :upvote]
  validates_uniqueness_of :user_id, scope: :city_id

end
