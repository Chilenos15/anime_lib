@ratingArr = ['EC', 'E', 'E 10+', 'T', 'M', 'RP', 'AO']

Anime.delete_all
Platform.delete_all

5.times do
  platform = Platform.create(
    name: Faker::Anime.platform,
    bought: Faker::Date.between(from: '2000-01-01', to: '2022-01-04'),
    user_id: 4
  )

  5.times do
    Anime.create(
      title: Faker::Anime.title,
      rating: @ratingArr.sample,
      image: "https://images.unsplash.com/photo-1513807762437-8c8dee6b3776?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=927&q=80",
      platform_id: platform.id
    )
  end
end

puts Platform.count