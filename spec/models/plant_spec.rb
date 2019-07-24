require 'rails_helper'

RSpec.describe Plant, type: :model do
  context 'associations' do
    it { should belong_to(:garden) }
    it { should belong_to(:plant_type) }
    it { should have_many(:irrigations) }
  end

  context '#calculate_status' do
    let(:plant) { create(:plant)}
    it 'should return status planted if plant has zero irrigations' do
      plant.calculate_status
      expect(plant.planted?).to eq true
    end

    it 'should return status growing if plant has 1..3 irrigations' do
      create(:irrigation, plant_id: plant.id)
      plant.calculate_status
      expect(plant.growing?).to eq true
    end

    it 'should return status mature if plant has 4..6 irrigations' do
      4.times do |i|
        create(:irrigation, plant_id: plant.id)
      end

      plant.calculate_status
      expect(plant.mature?).to eq true
    end

    it 'should return status saturated if plant has 7..10 irrigations' do
      8.times do |i|
        create(:irrigation, plant_id: plant.id)
      end

      plant.calculate_status
      expect(plant.saturated?).to eq true
    end

    it 'should return status dead if plant has more than ten irrigations' do
      11.times do |i|
        create(:irrigation, plant_id: plant.id)
      end

      plant.calculate_status
      expect(plant.dead?).to eq true
    end
  end
end
