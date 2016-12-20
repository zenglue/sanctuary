class Vote < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_one :comment

  enum status: [:unsubmitted, :submitted]

  def upvote(city)
      city.upvote_count.increment!
  end

  def downvote(city)
    city.downvote_count.increment!
  end
end
