# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ranch_house = House.create(address: "3053 Quail RD, Escondido, CA,92029")
city_house  = House.create(address: "1900 Mountain Valley Ln, Escondido, CA, 92029")
sweden_house = House.create(address:"Skattegarden 1A, Linkoping,Sverige")


alex = Person.create(name: "alex", house_id: 1)
tommy = Person.create(name:"tommy", house_id: 2)
critter = Person.create(name: "critter", house_id:3)

