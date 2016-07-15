# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or create!d alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)
admin = User.create!({
  first_name: "Bubble",
  last_name: "Tea",
  email: "bubble.t.stops@gmail.com",
  password: "password",
  password_confirmation: "password",
  admin: true
})

user = User.create!({
  first_name: "Test",
  last_name: "User",
  email: "test@test.com",
  password: "password",
  password_confirmation: "password",
  admin: false
})

chatime = Shop.create!({
  name: "Chatime",
  address: "31 Harrison Ave.",
  city: "Boston",
  state: "MA",
  zip: "02111",
  description: "My go-to place for Milk Tea in the city. Lines are always long!",
  hours: "10AM - 11PM",
  pricing: "$4 for regular size, $5.50 for a large",
  user_id: admin.id
})

teado = Shop.create!({
  name: "TeaDo",
  address: "8 Tyler St.",
  city: "Boston",
  state: "MA",
  zip: "02111",
  description: "Great selection of teas with food options as well. Great place for a late-night snack.",
  hours: "10:30AM - 1AM",
  user_id: admin.id
})

kungfu = Shop.create!({
  name: "Kung Fu Tea",
  address: "334 Massachusetts Ave.",
  city: "Boston",
  state: "MA",
  zip: "02115",
  description: "Popular chain for authentic Taiwanese bubble tea. Hot and cold options available.",
  hours: "11AM - 11PM",
  pricing: "$4.50 for regular size, $5.50 for a large",
  user_id: admin.id
})

tealosophy = Shop.create!({
  name: "Tealosophy",
  address: "3 North Beacon St.",
  city: "Boston",
  state: "MA",
  zip: "02134",
  description: "Local place for reasonably priced bubble tea. Wide selection of milk and fruit flavors.",
  hours: "11AM - 11PM",
  pricing: "Iced - $3, Blended - $4.50",
  user_id: admin.id
})

kf_review = Review.create!({
  user_id: user.id,
  shop_id: kungfu.id,
  rating: 5,
  comment: "Absolutely love this place!"
})

teado_review = Review.create!({
  user_id: user.id,
  shop_id: teado.id,
  rating: 5,
  comment: "I would give it 6 stars if I could"
})

ct_review = Review.create!({
  user_id: user.id,
  shop_id: chatime.id,
  rating: 4
})
