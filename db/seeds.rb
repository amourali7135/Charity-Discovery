require 'faker'
#I had to nest it according to Rayhan because of ID issues.
puts "Destroy everything"
Charity.destroy_all
Campaign.destroy_all
User.destroy_all

stupid_booleans = ["True", "False"]
issues = ["Poverty", "Housing", "Social Justice", "Food", "LGBQT", "Children", "Animals", "International Housing", "Immigration", "Environmental", "Education", "Medical"]

puts 'Creating 20 fake users/charities...'
20.times do
  user = User.new(
    email: Faker::Internet.unique.email,
    # username: Faker::Alphanumeric.alpha(number: 10),
    password: 'password'
  )
  user.save!

  charity = Charity.new(
    # remote_photo_url: Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg"), #This is a fallback, use active storage next time for seeding instead, lecture somewhere.
    name:    Faker::Name.name,
    aged:  Faker::Number.between(from: 0, to: 150),
    income: Faker::Number.between(from: 0, to: 100000000),
    biography: Faker::Quote.most_interesting_man_in_the_world,
    intentions:  Faker::Artist.name,
    size:  Faker::Number.between(from: 1, to: 100),
    country:  CountryStateSelect.countries_collection.map { |country| country[1].to_s }.sample,
    country_focus:  CountryStateSelect.countries_collection.map { |country| country[1].to_s }.sample,
    city:  Faker::Address.city,
    program_percentage:  Faker::Number.between(from: 1, to: 100),
    cost_to_100:  Faker::Number.between(from: 1, to: 100),
    fiveohone: stupid_booleans.sample,
    phone:  Faker::PhoneNumber.cell_phone,
    types:  Charity.types.sample(1),
    email: charity.user.email,
    mission: Faker::Quote.most_interesting_man_in_the_world,
    goal: Faker::Quote.most_interesting_man_in_the_world,
    issues: issues.sample(2),
  )
  charity.user = user
  charity.save!

  puts 'Creating 60 fake campaigns...'
  2.times do
    campaign = Campaign.new(
    title: Faker::Lorem.sentences(number: 1),
    goal: Faker::Lorem.sentences(number: 1),
    how: Faker::Lorem.sentences(number: 1),
    completion_date: Faker::Commerce.price,
    anonymous: Faker::Boolean.boolean,
    total: Faker::Number.between(from: 0, to: 2500),
    types: Inquiry.types.sample(1),
    hidden: stupid_booleans.sample,
    format: Inquiry.formats.sample(1),
    instructions: Faker::Lorem.sentences(number: 1),
    tag_list: Inquiry.tags.sample(3),
    buyer: buyer
    )
    campaign.save!
  end
  puts 'Finished!'
end
puts 'Finished!'
