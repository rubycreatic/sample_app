namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "first user",
                 email: "first_user@example.com",
                 password: "variable",
                 password_confirmation: "variable")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@example.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end