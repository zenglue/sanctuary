class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :votes
  has_many :cities, through: :votes, source: :city
  has_many :upvoted_cities, -> { where "votes.vote_type = 1" }, through: :votes, source: :city
  has_many :downvoted_cities, -> { where "votes.vote_type = 0" }, through: :votes, source: :city

  enum role: [:user, :admin, :guest]

  def is_admin?
    self.role == 1
  end

  def is_guest?
    self.role == 2
  end
end
