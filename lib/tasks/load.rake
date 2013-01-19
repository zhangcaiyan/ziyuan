#coding: utf-8

namespace :load do
  desc "导入用户数据"
  task :user => :environment do
    puts "填充账户数据 开始"
    user = Setting::User.user
    if !User.exists?(email: user.email )
      user=User.create(user)
      User.confirm_by_token(user.confirmation_token)
      puts "填充账户数据 完毕"
    end
  end
end
