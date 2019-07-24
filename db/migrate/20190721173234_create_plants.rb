class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.integer :root_length
      t.integer :status

      t.timestamps
    end
  end
end
