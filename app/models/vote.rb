class Vote < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_one :comment

  enum vote_type: [:downvote, :upvote]

  validates :user_id, uniqueness: {scope: :city_id}

  def comment_attributes=(comment_attributes)
    self.comment.update(comment_attributes)
  end
end
