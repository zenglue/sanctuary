class User < ApplicationRecord
  has_many :comments

  enum role: [:guest, :user]

end
