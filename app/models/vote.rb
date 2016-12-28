class Vote < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_one :comment, dependent: :destroy

  enum vote_type: [:downvote, :upvote]

  validates :user_id, uniqueness: {scope: :city_id}

  def comment_attributes=(comment_attributes)
    self.comment_attributes.build
  end
end

# https://codingdragon530.wordpress.com/2016/11/04/authenticating-with-omniauth/
