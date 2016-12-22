20.times do
  City.create(
  name: Faker::Address.city,
  state: Faker::Address.state,
  official_status: Faker::Number.between(0, 3)
  )
end

5.times do
  User.create(
  username: Faker::Internet.user_name,
  email: Faker::Internet.email,
  password: Faker::Internet.password,
  role: 1
  )
end
