# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

NUM_USERS = 7
NUM_EVENTS = 30

counter = 0

NUM_USERS.times do 
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}-#{last_name}-#{counter}@gmail.com",
    password: "supersecret",
    img_url: "https://i.pinimg.com/236x/e6/6f/14/e66f14e52252fc0eacbc28e54850b274.jpg"
  )
  counter += 1
end

NUM_EVENTS.times do 
  Event.create(
    user: User.all.sample,
    title: Faker::Quotes::Shakespeare.romeo_and_juliet_quote,
    description: Faker::Movies::Ghostbusters.quote,
    where: Faker::Games::ElderScrolls.city,
    date: "#{rand(10..31)} August, 2019",
    img_url: Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg")

  )
users = User.all
events = Event.all

  puts Cowsay.say("Generated #{events.count} Events", :frogs)
  puts Cowsay.say("Generated #{users.count} users", :stegosaurus)
 

end