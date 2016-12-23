class Vote < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_one :comment
  enum vote_type: [:downvote, :upvote]
  validates_uniqueness_of :user_id, allow_nil: true
  validates_presence_of :city_id

end
