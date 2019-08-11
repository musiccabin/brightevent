User.destroy_all
Rsvp.destroy_all

NUM_USERS = 6
NUM_EVENTS = 100

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

20.times do
  Tag.create(
    name: Faker::Game.genre
  )
end


tags = Tag.all
users = User.all
events = Event.all



NUM_EVENTS.times do 
  created_at = Faker::Date.backward( days: 100)
  e = Event.create(
    user: User.all.sample,
    title: Faker::Quotes::Shakespeare.romeo_and_juliet_quote,
    description: Faker::Movies::Ghostbusters.quote,
    where: Faker::Games::ElderScrolls.city,
    date: "#{rand(11..31)}, August, 2019",
    img_url: 'https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/8/2018/01/15155312/iStock-667709450.jpg'

  )

  if e.valid?
    e.rsvps = rand(0..6).times.map do
      Rsvp.new(user: users.sample)
    end
    e.tags = tags.shuffle.slice(0, rand(tags.count / 2))
    # e.rsvps = users.shuffle.slice(0, rand(users.count))
  end

end

events = Event.all


  puts Cowsay.say("Generated #{events.count} Events", :frogs)
  puts Cowsay.say("Generated #{users.count} users", :stegosaurus)
  puts Cowsay.say("Generated #{tags.count} tags", :kitty)
 




