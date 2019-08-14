puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'

5.times do
  restaurants_attributes = [
  {
    name:         Faker::Name.unique.name,
    address:      Faker::Address.city,
    phone_number: Faker::PhoneNumber.cell_phone,
    category:     ['chinese', 'italian', 'japanese', 'french', 'belgian'].sample
  }
]
  Restaurant.create!(restaurants_attributes)
end
puts 'Finished!'
