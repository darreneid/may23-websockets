# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

chat1 = Chat.create!(tea: 'oolong')
chat2 = Chat.create!(tea: 'chai')

m1 = Message.create!(body: 'the best', chat: chat1)
m2 = Message.create!(body: 'no it isn\'t', chat: chat1)
m3 = Message.create!(body: 'anybody there?', chat: chat2)