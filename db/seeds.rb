# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  { username: "james", password: "123" },
  { username: "sean", password: "123" },
  { username: "jon", password: "123" },
  { username: "sebastian", password: "123" },
  { username: "esther", password: "123" }
])

circles = FriendCircle.create([
  { user_id: 1, name: "friends" },
  { user_id: 1, name: "family" },
  { user_id: 2, name: "cats" }
])

memberships = Membership.create([
  { friend_circle_id: 1, friend_id: 2 },
  { friend_circle_id: 1, friend_id: 4 },
  { friend_circle_id: 2, friend_id: 3 },
  { friend_circle_id: 3, friend_id: 4 },
  { friend_circle_id: 3, friend_id: 5 },
])
