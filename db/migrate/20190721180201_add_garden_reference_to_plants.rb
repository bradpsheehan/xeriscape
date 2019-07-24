class AddGardenReferenceToPlants < ActiveRecord::Migration[5.2]
  def change
    add_reference :plants, :garden, index:true, foreign_key: true
  end
end
