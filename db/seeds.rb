
List.create(name: "Places I've been")
List.create(name: "Places I want to go")

User.create(username: "Steph", email: "s.curry@gmail.com", password: "password")
User.create(username: "Bey", email: "bhive@egmail.com", password: "password")
User.create(username: "Daria", email: "shadeyboots@gmail.com", password: "password")

Place.create(name: "Japan", content: "Buy tickets for the Robot restaurant in japanese, your phone will auto translate to english and the ticket will be cheaper", user_id: 1, list_id: 1)
Place.create(name: "Bali", content: "Ignore the guides at Goa Temple, they are scammers!", user_id: 1, list_id: 1)
Place.create(name: "India", content: "I want to see the Taj Mah Hal", user_id: 1, list_id: 2)
Place.create(name: "Italy", content: "I want to see the leaning tower of Pisa.", user_id: 1, list_id: 2)