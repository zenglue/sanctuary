class City < ApplicationRecord
  has_many :city_commments
  has_many :comments, through: :city_comments

  enum status: [:non_sancutuary, :sanctuary]
end
