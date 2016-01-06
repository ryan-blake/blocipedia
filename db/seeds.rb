
#Creates Users
5.times do
  user = User.new(
  # #3
  email:   Faker::Internet.email,
  name:     Faker::Name.name,
  password: "testtest"
  )
  user.skip_confirmation!
  user.save!
end
users = User.all


# Creates i
20.times do
  Wiki.create!(
  title:       Faker::Hipster.word,
  body:    Faker::Hipster.paragraph,
  user:   users.sample,
  # created_at: "2015-12-10 20:24:01"
  )
end

# Create an admin user
admin = User.create!(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'testtest',
  role:     'admin'
)

wikis = Wiki.all


puts "Seed finished"
puts "#{Wiki.count}  wikis created"
puts "#{User.count}  user created"
