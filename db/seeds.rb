# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create(username: 'admin', email: 'aa@aa.com', password: "aa", user_type: "admin")
bb = User.create(username: 'bb', email: 'bb@bb.com', password: 'bb')

game = Category.create(name: 'Game')
food = Category.create(name: 'Food')


r1 = Room.create(title: 'LOL', category_id: 1, user_id: 1)
r2 = Room.create(title: 'Pizza Time', category_id: 2, user_id: 2)
