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
  {text: "romance"},
  {text: "this tho"}
])

stephen = User.create(email: "stephen@github.com", password: "password", password_confirmation: "password")

hony = stephen.clips.create(
  title: "humans of new york",
  transcript: "'She’s stubborn, which I love. Because I like a challenge.'\n'When’s the first time you realized she was stubborn?'\n'We’d just graduated from college, and we were looking for jobs. She had some offers, but she said she wasn’t going to accept anything less than $35,000. That was a lot of money back in 1996. So I kept telling her: ‘Don’t be greedy. You don’t have any experience yet. Start small and work up.’ But she wouldn’t budge. And of course, she ended up getting exactly what she wanted.'",
  description: "quite touching",
  is_private: false)

hony.tags.create([
  {text: "romance"},
  {text: "new york"},
  {text: "love"},
  {text: "challenge"},
  {text: "rando tag"}
])

sofya = User.create(email: "sofya@github.com", password: "password", password_confirmation: "password")

yuletide = sofya.clips.create(
  title: "yuletide hats",
  transcript: "YULETIDE POM HATS ARE BACK!!\nAfter waiting what felt like one million hundred years, our Make The Yuletide Gay Pom Hats are back in action. You’ve never been so happy that winter is still upon us slash whatever if you live where it’s summer they are still great.\nBuy ‘em here for only 15 SMACKEROOS.\n<3",
  description: "gays in hats",
  is_private: "false")

yuletide.tags.create([
  {text: "gay"},
  {text: "rando tag"},
  {text: "bromance"},
  {text: "hats"}
])