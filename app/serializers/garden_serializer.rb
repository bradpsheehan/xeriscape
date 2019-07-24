class GardenSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :name,
    :description,
    :plants,
    :plant_root_lengths
  )

  def plants
    self.object.plants
      .joins(:plant_type)
      .select('plants.*, plant_types.name, plant_types.description')
  end

  def plant_root_lengths
    root_lengths = {}
    self.object.plants.each do |plant|
      root_lengths[plant.id] = {
        root_length: plant.root_length,
        status: plant.status
      }
    end
    root_lengths
  end

end
