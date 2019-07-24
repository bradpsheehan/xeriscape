require 'rails_helper'

RSpec.describe Xeriscaper, type: :model do
  it 'Initializes a new garden with zero plants' do
    xeriscaper = Xeriscaper.new
    expect(xeriscaper.garden.plants.size).to eq 0
  end

  context '#plant_seeds' do
    it 'plants total of 1 lavender plant in the garden' do
      xeriscaper = Xeriscaper.new
      plants_config = [
        {quantity: 1, type: 'Lavender'}
      ]
      xeriscaper.plant_seeds(plants_config: plants_config)
      expect(xeriscaper.garden.plants.size).to eq 1
      expect(xeriscaper.garden.plants.first.type.class.name).to eq 'Lavender'
    end

    it 'plants total of 3 Russian Sage plants in the garden' do
      xeriscaper = Xeriscaper.new
      plants_config = [
        {quantity: 3, type: 'Valerian'}
      ]
      xeriscaper.plant_seeds(plants_config: plants_config)
      expect(xeriscaper.garden.plants.size).to eq 3
      expect(xeriscaper.garden.plants.map(&:type).map{|p| p.class.name}.uniq).to eq ['Valerian']
    end

    it 'plants different quantities of different plants in the garden' do
      xeriscaper = Xeriscaper.new
      plants_config = [
        {quantity: 5, type: 'Soapwort'},
        {quantity: 2, type: 'Plumbago'}
      ]
      xeriscaper.plant_seeds(plants_config: plants_config)
      expect(xeriscaper.garden.plants.size).to eq 7
    end

  end
end
