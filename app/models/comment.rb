class Comment < ApplicationRecord
  belongs_to :user
  has_many :city_comments
end
