class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :vote

  validates :content, length: { maximum: 400}

  def add_comment(vote)
    vote.comment.build(id: vote.id)
  end
end
