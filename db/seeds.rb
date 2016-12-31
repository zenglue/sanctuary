
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
  5.times do
    votes = []
    votes << user.votes.build(
    vote_type: Faker::Number.between(0,1),
    city_id: Faker::Number.between(0,19)
    )
    votes.each do |vote|
      vote.save
    end
  end
end

valid_votes = Vote.select(:user_id, :city_id).distinct
valid_votes.each do |vote|
  vote.save
end

Vote.all.each do |vote|
  2.times do
    comments = []
    comments << vote.build_comment(
    content: Faker::Hipster.paragraph,
    user_id: vote.user_id
    )
    comments.each do |comment|
      if comment.vote_id.present?
        comment.save
      else
        comment.destroy
      end
    end
  end
end

City.all.each do |city|
  city.vote_count = Vote.where("city_id = ?", city.id).count
  city.save
end
