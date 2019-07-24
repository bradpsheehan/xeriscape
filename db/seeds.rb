# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

raw_plant_type_data = [{
                         name: 'Lavender',
                         description: 'Lavender is the name given to several species of herbaceous, perennial shrubs in the genus Lavandula which are grown as ornamental plants or for essential oil. Lavender plants are small, branching and spreading shrubs with grey-green leaves and long flowering shoots.'
                       },
                       { name: 'Plumbago',
                         description: 'Plumbago auriculata is an evergreen shrub, often grown as a climber, ascending rapidly to 6 m (20 ft) tall by 3 m (10 ft) wide in nature, though much smaller when cultivated as a houseplant.'
                       }]

raw_plant_type_data.map do |plant_type|
  PlantType.where(name: plant_type[:name], description: plant_type[:description]).first_or_create
end

garden = Garden.first_or_create(name: 'Front Yard Xeriscape Garden')

Plant.create(plant_type_id: PlantType.where(name: 'Lavender').first.id, garden_id: garden.id, root_length: 0, status: 0)
Plant.create(plant_type_id: PlantType.where(name: 'Plumbago').first.id, garden_id: garden.id, root_length: 0, status: 0)
