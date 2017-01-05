
20.times do
  City.create(
  name: Faker::Address.city,
  state: Faker::Address.state,
  official_status: Faker::Number.between(0, 3)
  )
end

20.times do
  User.create(
  username: Faker::Internet.user_name,
  email: Faker::Internet.email,
  password: Faker::Internet.password,
  role: 0
  )
end

User.all.each do |user|
  votes = []
  5.times do
    votes << user.votes.build(
    vote_type: Faker::Number.between(0,1),
    city_id: Faker::Number.between(0,19)
    )
    votes.each do |vote|
      if vote.valid?
        vote.save
      end
    end
  end
end

Vote.all.each do |vote|
  comments = []
  comments << vote.create_comment(
  content: Faker::Hipster.paragraph,
  user_id: vote.user_id
  )
end

City.all.each do |city|
  city.vote_count = Vote.where("city_id = ?", city.id).count
  city.update_vote_balance
  city.save
end
