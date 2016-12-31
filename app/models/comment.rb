class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :vote

  delegate :city, to: :vote

  default_scope {order(created_at: :desc)}

  validates :content, presence: true, length: { minimum: 25, maximum: 500}

end
