class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :votes, dependent: :destroy
  has_many :upvoted_cities, through: :votes, source: :city
  has_many :downvoted_cities, through: :votes, source: :city

  enum role: [:guest, :user, :admin]

end
