#coding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user, test = Setting::User.user, Setting::User.test 
[user, test].each do |u|
  if !User.exists?(email: u.email )
    user=User.create(u)
    User.confirm_by_token(user.confirmation_token)
    puts "填充账户数据"
  end
end
