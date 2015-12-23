1.times do
  user = User.new(

  email: "r@j.com",
  password: "testtest"
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

include RandomData

#Creates Users
5.times do
  user = User.new(
  # #3
  email:    RandomData.random_email,
  password: RandomData.p
  )
  user.skip_confirmation!
  user.save!
end
users = User.all


# Creates i
# 20.times do
#   wiki.create!(
#     title:   RandomData.random_name,
#     body: RandomData.random_word,
#
#
#     user:   users.sample,
#     # created_at: "2015-12-10 20:24:01"
#   )
# end
# wikiss = Wiki.all


puts "Seed finished"
# puts "#{Wiki.count}  wikis created"
puts "#{User.count}  user created"
