# coding: utf-8

puts 'SETTING UP DEFAULT USERS & Categories'
user = User.create! :name => 'Alexander Andreev', :email => 'cinic.rus@gmail.com', :password => '12345', :role => 'admin'
puts 'New user created: ' << user.name
user2 = User.create! :name => 'Ruslan Smirnov', :email => 'r.k.smirnov@gmail.com', :password => '123456', :role => 'admin'
puts 'New user created: ' << user2.name

coursetype = CourseType.create! :name => 'actions', :title => 'Базовый курс', :description => 'Получи общие сведения об инвестициях, изучив как работают акции и что значит быть акционером.'
puts 'New course type created: ' << coursetype.title