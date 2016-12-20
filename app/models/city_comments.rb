class CityComment < ApplicationRecord
  belongs_to :comment
  belongs_to :city
end
