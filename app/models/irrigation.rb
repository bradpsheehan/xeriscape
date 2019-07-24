class Irrigation < ApplicationRecord
  belongs_to :plant

  after_create :update_plant_health

  def update_plant_health
    plant.update_attributes(root_length: plant.root_length + 2, status: plant.calculate_status)
  end
end
