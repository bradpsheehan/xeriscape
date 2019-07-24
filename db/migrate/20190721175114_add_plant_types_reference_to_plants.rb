class AddPlantTypesReferenceToPlants < ActiveRecord::Migration[5.2]
  def change
    add_reference :plants, :plant_type, index:true, foreign_key: true
  end
end
