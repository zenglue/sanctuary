class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :vote

  validates :content, length: { maximum: 400}
end
