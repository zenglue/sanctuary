class Vote < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_one :comment
  enum vote_type: [:downvote, :upvote]
  validates :user_id, uniqueness: {scope: :city_id}

end

# https://codingdragon530.wordpress.com/2016/11/04/authenticating-with-omniauth/
