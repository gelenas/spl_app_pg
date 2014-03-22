namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@hotmail.com",
                         admin: true)
    23.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@hotmail.com"
      User.create!(name: name,
                   email: email)
    end
    users = User.all(limit: 6)
    33.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end
end