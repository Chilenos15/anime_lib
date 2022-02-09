

5.times do
  Platform.create(
    name: Faker::Anime.platform,
    bought: Faker::Date.between(from: '2000-01-01', to: '2022-01-04'),
    user_id: 4
  )
end

puts Platform.count