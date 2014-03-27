users = [ivan = User.create(email: "thefenry@gmail.com", password: "ivan", password_confirmation: "ivan", name: "Ivan", bio: Faker::Lorem.paragraph, image: "http://localhost:3000/assets/default_user_image.svg"),
brittany = User.create(email: "brittany@example.com", password: "brittany", password_confirmation: "brittany", name: "Brittany", bio: Faker::Lorem.paragraph, image: "http://localhost:3000/assets/default_user_image.svg"),
jose = User.create(email: "jose@example.com", password: "jose", password_confirmation: "jose", name: "Jose", bio: Faker::Lorem.paragraph, image: "http://localhost:3000/assets/default_user_image.svg"),
irene = User.create(email: "irene@example.com", password: "irene", password_confirmation: "irene", name: "Irene", bio: Faker::Lorem.paragraph, image: "http://localhost:3000/assets/default_user_image.svg"),
anne = User.create(email: "anne@example.com", password: "anne", password_confirmation: "anne", name: "Anne", bio: Faker::Lorem.paragraph, image: "http://localhost:3000/assets/default_user_image.svg"),
jamie = User.create(email: "jamie@example.com", password: "jamie", password_confirmation: "jamie", name: "Jamie", bio: Faker::Lorem.paragraph, image: "http://localhost:3000/assets/default_user_image.svg"),
mathilde = User.create(email: "mathilde@example.com", password: "mathilde", password_confirmation: "mathilde", name: "Mathilde", bio: Faker::Lorem.paragraph, image: "http://localhost:3000/assets/default_user_image.svg"),
armando = User.create(email: "armando@example.com", password: "armando", password_confirmation: "armando", name: "Armando", bio: Faker::Lorem.paragraph, image: "http://localhost:3000/assets/default_user_image.svg"),
johnny = User.create(email: "johnny@example.com", password: "johnny", password_confirmation: "johnny", name: "Johnny", bio: Faker::Lorem.paragraph, image: "http://localhost:3000/assets/default_user_image.svg"),
chermaine = User.create(email: "chermaine@example.com", password: "chermaine", password_confirmation: "chermaine", name: "Chermaine", bio: Faker::Lorem.paragraph, image: "http://localhost:3000/assets/default_user_image.svg")]


users.each do |user|
  users.each do |friend|
    next if user == friend
    user.friends << friend
  end
end

today = Time.now
goals = ["Graduate from DBC", "Run a marathon", "Drink more water", "Save more money", "Work out 3x a week"]

users.each do |user|
  buddies = (1..10).to_a
  buddies.delete(user.id)
  user.goals << Goal.create(title: goals.sample,
              description: "Betcha I can do it!",
              bet_amount: (10..1000).to_a.sample,
              start_date: today,
              end_date: today + (200000..999999).to_a.sample,
              buddy_id: buddies.sample)
end