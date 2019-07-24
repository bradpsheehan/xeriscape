require 'rails_helper'

RSpec.describe PlantType, type: :model do
  it { should have_many(:plants) }
end
