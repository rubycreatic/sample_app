# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new(name: "pepito" , email: "pepito@example.com" , password: "hola_mundo" , password_confirmation: "hola_mundo")
user.save 

#user = User.create(name: "pepito" , email: "pepito@example.com" , password: "hola_mundo" , password_confirmation: "hola_mundo")

