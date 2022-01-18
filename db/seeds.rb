# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

action_list = [
  ['work', 'Go to work', -5, -30, 0, 70, 100],
  ['nature', 'Enjoy nature', 0, -10, 1, 10, 0],
  ['series', 'Drink wine and watch TV series', -5, 30, -1, 10, -20],
  ['bar', 'Go to a bar', -10, 60, 1, 40, -100],
  ['marginal', 'Drink with marginal people', -80, 90, 5, 80, -150],
  ['metro', 'Sing in the subway', 0, 10, 1, 20, 20],
  ['sleep', 'Sleep', 90, -50, -3, -70, 0],
  ['grandpa', 'Drink with grandpa', -100, 100, -10, -100, 0]
]

action_list.each do |name, description, health, mana, cheerfulness, fatigue, money|
  ValeraAction.create( name: name, description: description, health:health, mana: mana, cheerfulness: cheerfulness, fatigue: fatigue, money: money)
end
