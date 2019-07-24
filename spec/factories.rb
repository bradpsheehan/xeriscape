FactoryBot.define do
  factory :plant do
    garden
    plant_type
    root_length { 0 }
  end

  factory :plant_type do
    name { 'Lavender' }
  end

  factory :garden do
    name { 'Front Yard Garden' }
  end

  factory :irrigation do

  end
end
