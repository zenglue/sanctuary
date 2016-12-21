class Vote < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_one :comment
  enum type: [:downvote, :upvote]
  validates_uniqueness_of :city_id, scope: :user_id

end
