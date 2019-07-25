require 'rails_helper'

RSpec.describe Garden, type: :model do
  it { should have_many(:plants) }

  context '#plant_seeds' do

    it 'adds 3 Lavender plants to the garden' do
      garden = create(:garden)
      lavender = create(:plant_type, name: 'Lavender')
      garden.plant_seeds([{qty: 3, plant_type_id: lavender.id}])
      plant_types = garden.plants.map do |p|
        p.plant_type.name
      end.uniq

      expect(garden.plants.size).to eq 3
      expect(plant_types).to eq ["Lavender"]
    end
  end
end
