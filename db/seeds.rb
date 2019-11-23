# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy(User.pluck('id'))
User.create(vk_id: "118966260", name: "Ксюша", state: "null")
User.create(vk_id: "136273155", name: "Антон", state: "null")
User.create(vk_id: "186835264", name: "Анна", state: "null")
User.create(vk_id: "277275242", name: "Иван", state: "null")
User.create(vk_id: "420111785", name: "Полина", state: "null")
User.create(vk_id: "319004295", name: "Лиза")
User.create(vk_id: "52366223", name: "Илья Лепа", state: "null")
User.create(vk_id: "93211415", name: "Вадим", state: "null")