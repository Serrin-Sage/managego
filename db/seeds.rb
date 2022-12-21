# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "Starting Seed"
manager_ids = []
tenant_ids = []
building_ids = []

#Create tenants
8.times do
  fake_name = Faker::Name.name
  tenant = Tenant.create!(
    first_name: fake_name.split(' ')[0],
    last_name: fake_name.split(' ')[1],
    email: fake_name.gsub(" ", "").downcase + "@exmaple.com",
    password: '123'
  )
  tenant_ids << tenant.id
end

#Create managers
4.times do
  fake_name = Faker::Name.name
  tenant = Manager.create!(
    first_name: fake_name.split(' ')[0],
    last_name: fake_name.split(' ')[1],
    email: fake_name.gsub(" ", "").downcase + "@manager.com",
    password: "456"
  )
  manager_ids << manager.id
end

#Create buildings
4.times do
  building = Building.create(
    street_address: Faker::Address.street_address,
    manager_id: manager_ids.sample
  )
  building_ids << building.id
end


20.times do
  letters = ('A'..'Z').to_a
  numbers = (1..99).to_a

  apt = Apartment.create(
    building_id: building_ids.sample,
    apt_number: %(#{numbers.sample}#{letters.sample})
  )
end

p "Seeding Successful!"