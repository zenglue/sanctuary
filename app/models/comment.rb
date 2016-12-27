class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :vote

  delegate :city, to: :vote

  validates :content, presence: true, length: { maximum: 400}

end
