class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :votes
  has_many :upvoted_cities, -> { where vote_type: 1 }, through: :votes, source: :city
  has_many :downvoted_cities, -> { where vote_type: 0 }, through: :votes, source: :city

  enum role: [:user, :admin]

end
