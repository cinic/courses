# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Alexander Andreev', :email => 'cinic.rus@gmail.com', :password => '12345', :password_confirmation => '12345'
puts 'New user created: ' << user.name
user2 = User.create! :name => 'Ruslan Smirnov', :email => 'r.k.smirnov@gmail.com', :password => '123456', :password_confirmation => '123456'
puts 'New user created: ' << user2.name