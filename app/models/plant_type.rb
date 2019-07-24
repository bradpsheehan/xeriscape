class PlantType < ApplicationRecord
  has_many :plants, dependent: :destroy
end
