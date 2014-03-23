ivan = User.create(email: "thefenry@gmail.com", password: "ivan", password_confirmation: "ivan", name: "Ivan", bio: Faker::Lorem.paragraph)
brittany = User.create(email: "brittany@betterbet.com", password: "brittany", password_confirmation: "brittany", name: "Brittany", bio: Faker::Lorem.paragraph)
jose = User.create(email: "jose@betterbet.com", password: "jose", password_confirmation: "jose", name: "Jose", bio: Faker::Lorem.paragraph)
irene = User.create(email: "irene@betterbet.com", password: "irene", password_confirmation: "irene", name: "Irene", bio: Faker::Lorem.paragraph)
anne = User.create(email: "anne@betterbet.com", password: "anne", password_confirmation: "anne", name: "Anne", bio: Faker::Lorem.paragraph)

ivan.friends << anne
ivan.friends << brittany
brittany.friends << jose
irene.friends << jose
irene.friends << anne

ivan.goals.create(title: "Finish",
                  description: "I would like to finish this on time",
                  bet_amount: 30,
                  start_date: Time.now,
                  end_date: Time.now + 20000,
                  buddy_id: ivan.friends.find(brittany).id

irene.goals.create(title: "Be successful",
                  description: "I will graduated dbc",
                  bet_amount: 100,
                  start_date: Time.now,
                  end_date: Time.now + 20000,
                  buddy_id: irene.friends.find(jose).id
