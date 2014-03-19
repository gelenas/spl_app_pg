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
  end
end