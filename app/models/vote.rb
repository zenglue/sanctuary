class Vote < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_one :comment

  enum type: [:downvote, :upvote]

end
