# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# roles = [    
#     {
#         privilege: "user",
#         description: "Users are allowed to browse pages, create a profile page and purchase items. They can become an artist by paying a registration fee"
        
#     },
#     {
#         privilege: "artist",
#         description: "Artists have all the same privileges as a user except they can sell products that they have created"
#     },
#     {
#         privilege: "admin",
#         description: "Admins have the ability to change thing such as featured items"
#     }
# ]

# roles.each do |role|
#     Role.create(privilege: role[:privilege], description: role[:description])
# end

carts = []
products = [
    {
        name: "Wooden Aeroplane",
        
    }
]
wishlists = []
profiles = []

