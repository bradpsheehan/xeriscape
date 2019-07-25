class Garden < ApplicationRecord
  has_many :plants, dependent: :destroy

  def plant_seeds(plant_config)
    plant_config.map do |plant|
      plant[:qty].times do |i|
        Plant.create(garden_id: id, plant_type_id: plant[:plant_type_id])
      end
    end
  end
end
