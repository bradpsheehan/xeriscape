class CreateIrrigations < ActiveRecord::Migration[5.2]
  def change
    create_table :irrigations do |t|
      t.references  :plant, index: true, foreign_key: true
    end
  end
end
