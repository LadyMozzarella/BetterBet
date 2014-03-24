users = [ivan = User.create(email: "thefenry@gmail.com", password: "ivan", password_confirmation: "ivan", name: "Ivan", bio: Faker::Lorem.paragraph),
brittany = User.create(email: "brittany@example.com", password: "brittany", password_confirmation: "brittany", name: "Brittany", bio: Faker::Lorem.paragraph),
jose = User.create(email: "jose@example.com", password: "jose", password_confirmation: "jose", name: "Jose", bio: Faker::Lorem.paragraph),
irene = User.create(email: "irene@example.com", password: "irene", password_confirmation: "irene", name: "Irene", bio: Faker::Lorem.paragraph),
anne = User.create(email: "anne@example.com", password: "anne", password_confirmation: "anne", name: "Anne", bio: Faker::Lorem.paragraph),
jamie = User.create(email: "jamie@example.com", password: "jamie", password_confirmation: "jamie", name: "Jamie", bio: Faker::Lorem.paragraph),
mathilde = User.create(email: "mathilde@example.com", password: "mathilde", password_confirmation: "mathilde", name: "Mathilde", bio: Faker::Lorem.paragraph),
armando = User.create(email: "armando@example.com", password: "armando", password_confirmation: "armando", name: "Armando", bio: Faker::Lorem.paragraph),
johnny = User.create(email: "johnny@example.com", password: "johnny", password_confirmation: "johnny", name: "Johnny", bio: Faker::Lorem.paragraph),
chermaine = User.create(email: "chermaine@example.com", password: "chermaine", password_confirmation: "chermaine", name: "Chermaine", bio: Faker::Lorem.paragraph)]


users.each do |user|
  users.each do |friend|
    next if user == friend
    user.friends << friend
  end
end

today = Time.now

users.each do |user|
  buddies = (1..10).to_a
  buddies.delete(user.id)
  Goal.create(title: "Graduate from DBC",
              description: "Become a badass Ruby and JavaScript developer.",
              bet_amount: (10..1000).to_a.sample,
              start_date: today,
              end_date: today + (20000..99999).to_a.sample,
              buddy_id: buddies.sample)

  Goal.create(title: "Run a marathon",
              description: "When I finally have more time.",
              bet_amount: (10..1000).to_a.sample,
              start_date: today,
              end_date: today+ (20000..99999).to_a.sample,
              buddy_id: buddies.sample)
end

# 30.times do
#   Goal.create(title: Faker::Lorem.word,
#                 description: Faker::Lorem.paragraph,
#                 bet_amount: (10..1000).to_a.sample,
#                 start_date: Time.now,
#                 end_date: Time.now + (20000..99999).to_a.sample,
#                 buddy_id: (1..10).to_a.sample)
# end
