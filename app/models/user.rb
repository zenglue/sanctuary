class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
  has_many :comments
  has_many :votes
  has_many :cities, through: :votes, source: :city
  has_one :profile
  has_many :upvoted_cities, -> { where "votes.vote_type = 1" }, through: :votes, source: :city
  has_many :downvoted_cities, -> { where "votes.vote_type = 0" }, through: :votes, source: :city

  enum role: [:user, :admin, :guest]

  def convert_user_to_admin
    self.update(role: 1)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name
    end
  end
end
