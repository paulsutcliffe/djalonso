# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.delete_all
Admin.create(:email => 'paul@kosmyka.com', :password => '12345678')
Admin.create(:email => 'ricardo@kosmyka.com', :password => '12345678')
