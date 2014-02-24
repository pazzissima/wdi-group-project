# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

kai = User.create(email: "kaifius@github.com", password: "password", password_confirmation: "password")

bromance = kai.clips.create(
    title: "bromancipation proclamation",
    transcript: "im pretty sure bromance is the perfect example of how embarrassingly fragile masculinity is. you know what a female bromance is called? a friendship",
    description: "my thoughts on bromance",
    is_private: true)

bromance.tags.create([
  {text: "bro"},
  {text: "masculinity"},
  {text: "bromance"},
  {text: "this tho"}
])