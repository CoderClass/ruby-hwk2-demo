# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.find_or_create_by(email: "a@example.com") do |user|
  user.name = "Adam"
  user.password = "asdf"
end

User.find_or_create_by(email: "b@example.com") do |user|
  user.name = "Brad"
  user.password = "asdf"
end

User.generate_users(10) if User.count < 10
