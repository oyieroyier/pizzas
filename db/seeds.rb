Pizza.destroy_all
Restaurant.destroy_all

puts 'Seeding 🍕...'

20.times do
  Pizza.create(
    [{ name: Faker::Food.dish, ingredients: Faker::Food.description }],
  )
end

puts 'Done seeding 🍕!'

puts 'Seeding 🍽️...'

10.times do
  Restaurant.create(
    [{ name: Faker::Restaurant.name, address: Faker::Address.full_address }],
  )
end
puts 'Done seeding 🍽️!'

20.times do
  RestaurantPizza.create(
    [
      {
        price: rand(10...15),
        pizza_id: rand(1..30),
        restaurant_id: rand(1..10),
      },
    ],
  )
end
