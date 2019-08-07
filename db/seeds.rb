


roles = [    
    {
        privilege: "user",
        description: "Users are allowed to browse pages, create a profile page and purchase items. They can become an artist by paying a registration fee"
    },
    {
        privilege: "artist",
        description: "Artists have all the same privileges as a user except they can sell products that they have created"
    },
    {
        privilege: "admin",
        description: "Admins have the ability to change thing such as featured items"
    }
]

roles.each do |role|
    Role.create(role)
end

# -----------------------------------------
# SEED REGULAR USERS (one for each member), note: standard "user" roles are already assigned to these users on creation
# SEED PROFILES and assign them to the users

users = [
    {
        email: "richard@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "mel@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "jov@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    }
]

users.each do |user|
    User.create!(user)
end



# note: when seeding profiles, we must put in the user_id foreign key, otherwise profiles wont be made because of the dependency on users

profiles = [
    {
        username: "coolRick",
        about: "i am a user",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "richard@gmail.com").id
    },
    {
        username: "awesomeMel",
        about: "i am a user",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "mel@gmail.com").id
    },
    {
        username: "chillJov",
        about: "i am a user",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "jov@gmail.com").id
    }
]

profiles.each do |profile|
    Profile.create!(profile)
end
    

# -----------------------------------------
# CREATE A FEW MORE USERS WHO ARE ARTISTS and going to sell stuff on the site (that have the role of an artist [role_id = 2])

# -----------------------------------------

artist_users = [
    {
        email: "bob@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "tom@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "amy@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    }
]

artist_users.each do |artist|
    User.create!(artist)
end

# Now we have to change the role of our 'artist' users to have a role_id of 2.
# We cannot directly assign them a role_id of 2 when seeding the artist_users because we have set it up so they automatically
# get a role_id of 1 upon creation of the user


# So we have to find our users bob, tom and amy (because we want them to be our artists) and then change their role
artists_to_change = ["bob", "tom", "amy"]
artists_to_change.each do |name|
    User.find_by(email: "#{name}@gmail.com").update_attribute(:role_id, 2)
end


# NOW WE MAKE PROFILES FOR OUR ARTISTS

artist_profiles = [
    {
        username: "BlueBob",
        about: "i like fishing",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "bob@gmail.com").id
    },
    {
        username: "TurquoiseTom",
        about: "aspiring artist",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "tom@gmail.com").id
    },
    {
        username: "AmberAmy",
        about: "i like selling things",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "amy@gmail.com").id
    }
]

artist_profiles.each do |artistprofile|
    Profile.create!(artistprofile)
end

## Create wishlists and carts for the 6 users that we currently have
profile_ids = [1, 2, 3, 4, 5, 6]
profile_ids.each do |id_num|
    Wishlist.create(profile_id: id_num)
    Cart.create(active_status: true, profile_id: id_num)
end

categories = [
    {
        category: "T-shirts"
    },
    {
        category: "Stickers"
    },
    {
        category: "iPhone cases"
    },
    {
        category: "Prints"
    }
]

categories.each do |category|
    Category.create!(category)
end

fandoms = [
    {
        fandom: "Marvel"
    },
    {
        fandom: "DC"
    },
    {
        fandom: "Star Wars"
    },
    {
        fandom: "Dr Who"
    },
    {
        fandom: "The Walking Dead"
    },
    {
        fandom: "Supernatural"
    },
    {
        fandom: "Pokemon"
    },
    {
        fandom: "Dragonball Z"
    },
    {
        fandom: "Fullmetal Alchemist"
    },
    {
        fandom: "Sherlock"
    },
    {
        fandom: "Adventure Time"
    },
    {
        fandom: "Game of Thrones"
    }
]

fandoms.each do |fandom|
    Fandom.create(fandom)
end



# -------------------------------------------------------------
# site inventory//
# bob owns the avengers t-shirt and jon snow artpiece
# tom own the daenerys artpiece and the marvel logo hoodie
# amy owns the minecraft creeper helmet and the rick and morty on canvas

products = [
    {
        name: "Dr Who T-Shirt",
        description: "Time Lord on cotton",
        profile_id: User.find_by(email: "bob@gmail.com").profile.id,
        category_id: 1,
        fandom_id: 4
    },
    {
        name: "Jon Snow Artpiece",
        description: "framed art piece",
        profile_id: User.find_by(email: "bob@gmail.com").profile.id,
        category_id: 4,
        fandom_id: 12
    },
    {
        name: "Daenerys Artpiece",
        description: "framed art piece",
        profile_id: User.find_by(email: "tom@gmail.com").profile.id,
        category_id: 4,
        fandom_id: 12
    },
    {
        name: "Marvel Logo Hoodie",
        description: "hoodie, 100% cotton",
        profile_id: User.find_by(email: "tom@gmail.com").profile.id,
        category_id: 1,
        fandom_id: 1
    },
    {
        name: "Pokemon iPhone Case",
        description: "phone case for pokemon enthusiasts",
        profile_id: User.find_by(email: "amy@gmail.com").profile.id,
        category_id: 3,
        fandom_id: 7
    },
    {
        name: "Jar Jar Binks on canvas",
        description: "painting of the iconic figure",
        profile_id: User.find_by(email: "amy@gmail.com").profile.id,
        category_id: 4,
        fandom_id: 3 
    }
]

products.each do |product|
    Product.create!(product)
end



# SEEDING STICKERS

stickers = [
    {
        name: "Pikachu sticker",
        description: "used for decorating your items",
        profile_id: User.find_by(email: "amy@gmail.com").profile.id,
        category_id: 2,
        fandom_id: 7
    },
    {
        name: "Young goku sticker",
        description: "young goku flying on his nimbus",
        profile_id: User.find_by(email: "bob@gmail.com").profile.id,
        category_id: 2,
        fandom_id: 8
    },
    {
        name: "Finn and Jake sticker",
        description: "best buds hanging out",
        profile_id: User.find_by(email: "bob@gmail.com").profile.id,
        category_id: 2,
        fandom_id: 11
    },
    {
        name: "Deadpool sticker",
        description: "deadpool and pony",
        profile_id: User.find_by(email: "bob@gmail.com").profile.id,
        category_id: 2,
        fandom_id: 1
    },
    {
        name: "Negan sticker",
        description: "bad guy",
        profile_id: User.find_by(email: "bob@gmail.com").profile.id,
        category_id: 2,
        fandom_id: 5
    },
    {
        name: "R2D2 sticker",
        description: "the famous robot",
        profile_id: User.find_by(email: "bob@gmail.com").profile.id,
        category_id: 2,
        fandom_id: 3
    },
    {
        name: "Chewbacca sticker",
        description: "roarr",
        profile_id: User.find_by(email: "bob@gmail.com").profile.id,
        category_id: 2,
        fandom_id: 3
    }
]

stickers.each do |sticker|
    Product.create(sticker)
end

image_names = ["dr-who-tshirt.jpg", "jon-snow-art.jpg", "daenerys-artpiece.jpg", "marvel-logo-hoodie.jpg", "squirtle-phone-case.jpg", "jarjar-binks-canvas.jpg", "pikachu-sticker.jpg", "goku-young-sticker.jpg", "finn_and_jake.jpg", "deadpool.jpg", "negan.jpg", "r2d2.jpg", "chewie.png"]
product_names = ["Dr Who T-Shirt", "Jon Snow Artpiece", "Daenerys Artpiece", "Marvel Logo Hoodie", "Pokemon iPhone Case", "Jar Jar Binks on canvas", "Pikachu sticker", "Young goku sticker", "Finn and Jake sticker", "Deadpool sticker", "Negan sticker", "R2D2 sticker", "Chewbacca sticker"]

zip = image_names.zip(product_names)

zip.each do |img_name, product_name|
    path = Rails.root.join("app", "assets", "images", img_name)
    Product.find_by(name: product_name).uploaded_image.attach(io: File.open(path), filename: img_name)
end


fandoms = [
    {
        fandom: "Marvel",
        image_name: "marvel-fandom.jpg"
    },
    {
        fandom: "DC",
        image_name: "dc-fandom.jpg"
    },
    {
        fandom: "Star Wars",
        image_name: "star-wars-fandom.jpg"
    },
    {
        fandom: "Dr Who",
        image_name: "dr-who-fandom.jpg"
    },
    {
        fandom: "The Walking Dead",
        image_name: "walking-dead-fandom.jpg"
    },
    {
        fandom: "Supernatural",
        image_name: "supernatural-fandom.jpg"
    },
    {
        fandom: "Pokemon",
        image_name: "pokemon-fandom.jpg"
    },
    {
        fandom: "Dragonball Z",
        image_name: "dragonball-z-fandom.jpg"
    },
    {
        fandom: "Fullmetal Alchemist",
        image_name: "fullmetal-alchemist-fandom.jpg"
    },
    {
        fandom: "Sherlock",
        image_name: "sherlock-fandom.jpg"
    },
    {
        fandom: "Adventure Time",
        image_name: "adventure-time-fandom.jpg"
    },
    {
        fandom: "Game of Thrones",
        image_name: "game-of-thrones-fandom.jpg"
    }
]

fandoms.each do |fandom|
    path = Rails.root.join("app", "assets", "images","fandoms", fandom[:image_name])
    Fandom.find_by(fandom: fandom[:fandom]).uploaded_image.attach(io: File.open(path), filename: fandom[:image_name])
end


# fandoms.each do |fandom|
#     Fandom.find_by(fandom: fandom[:fandom]).uploaded_image.purge
# end


sizes = [
    {
        category: "T-shirts",
        sizing: "XS"
    },
    {
        category: "T-shirts",
        sizing: "S"
    },
    {
        category: "T-shirts",
        sizing: "M"
    },
    {
        category: "T-shirts",
        sizing: "L"
    },
    {
        category: "T-shirts",
        sizing: "XL"
    },
    {
        category: "T-shirts",
        sizing: "XXL"
    },
    {
        category: "Stickers",
        sizing: "7.8 x 7.6 cm"
    },
    {
        category: "Stickers",
        sizing: "14 x 13.6 cm"
    },
    {
        category: "Stickers",
        sizing: "20.9 x 21.6 cm"
    },
    {
        category: "iPhone cases",
        sizing: "iPhone 6"
    },
    {
        category: "iPhone cases",
        sizing: "iPhone 7"
    },
    {
        category: "iPhone cases",
        sizing: "iPhone 8"
    },
    {
        category: "iPhone cases",
        sizing: "iPhone X"
    },
    {
        category: "Prints",
        sizing: "30.5 x 40.6 cm"
    },
    {
        category: "Prints",
        sizing: "40.6 x 50.8 cm"
    },
    {
        category: "Prints",
        sizing: "45.7 x 61 cm"
    },
    {
        category: "Prints",
        sizing: "61 x 81.3 cm"
    }
]

sizes.each do |size|
    Size.create!(size)
end

colors = ["black", "navy", "grey", "red", "orange", "green"]
colors.each do |color|
    Color.create(color_name: color)
end

   
    product_variants = [
            {
                    product_id: 1,         
                    size_id: 1,
                    stock_QTY: 20,
                    price: 16
    },
    {
        product_id: 1,         
        size_id: 2,
        stock_QTY: 20,
        price: 18
    },
    {
        product_id: 1,
        size_id: 3,
        stock_QTY: 20,
        price: 18                                       #------t-shirt sizes--------
    },
    {
        product_id: 1,
        size_id: 4,
        stock_QTY: 20,
        price: 18
    },
    {
        product_id: 1,         
        size_id: 5,
        stock_QTY: 20,
        price: 20
    },
    {
        product_id: 1,         
        size_id: 6,
        stock_QTY: 20,
        price: 22
    },

# ---------------------------------------------------product 1 end


    {
        product_id: 2,
        size_id: 14,
        stock_QTY: 20,
        price: 32
    },
    {
        product_id: 2,
        size_id: 15,
        stock_QTY: 20,
        price: 56                                       #----------Print sizes---------
    },
    {
        product_id: 2,         
        size_id: 16,
        stock_QTY: 20,
        price: 79
    },
    {
        product_id: 2,         
        size_id: 17,
        stock_QTY: 20,
        price: 98
    },

# ---------------------------------------------------product 2 end
    {
        product_id: 3,
        size_id: 14,
        stock_QTY: 20,
        price: 32
    },
    {
        product_id: 3,
        size_id: 15,
        stock_QTY: 20,
        price: 56
    },
    {
        product_id: 3,         
        size_id: 16,
        stock_QTY: 20,                                   #----------Print sizes---------
        price: 79
    },
    {
        product_id: 3,         
        size_id: 17,
        stock_QTY: 20,
        price: 98
    },

# ---------------------------------------------------product 3 end


    {
        product_id: 4,         
        size_id: 1,
        stock_QTY: 20,
        price: 16
    },
    {
        product_id: 4,         
        size_id: 2,
        stock_QTY: 20,                              #------t-shirt sizes--------
        price: 18
    },
    {
        product_id: 4,          #this makes a marvel logo hoodie (product_id of 4) with a size of M (size_id of 3)
        size_id: 3,
        stock_QTY: 20,
        price: 18
    },
    {
        product_id: 4,          #this makes a marvel logo hoodie (product_id of 4) with a size of L (size_id of 4)
        size_id: 4,
        stock_QTY: 20,
        price: 18
    },
    {
        product_id: 4,         
        size_id: 5,
        stock_QTY: 20,
        price: 20
    },
    {
        product_id: 4,         
        size_id: 6,
        stock_QTY: 20,
        price: 22
    },
# ---------------------------------------------------product 4 end
    {
        product_id: 5,
        size_id: 10,
        stock_QTY: 20,
        price: 14.25
    },
    {
        product_id: 5,         
        size_id: 11,
        stock_QTY: 20,                      #------iphone case sizes------
        price: 15.83
    },
    {
        product_id: 5,         
        size_id: 12,
        stock_QTY: 20,
        price: 16.75
    },
    {
        product_id: 5,         
        size_id: 13,
        stock_QTY: 20,
        price: 18.99
    },

# ---------------------------------------------------product 5 end
    {
        product_id: 6,
        size_id: 14,
        stock_QTY: 20,
        price: 32
    },
    {
        product_id: 6,
        size_id: 15,
        stock_QTY: 20,
        price: 56                               #----------Print sizes---------
    },
    {
        product_id: 6,         
        size_id: 16,
        stock_QTY: 20,
        price: 79
    },
    {
        product_id: 6,         
        size_id: 17,
        stock_QTY: 20,
        price: 98
    },
# ---------------------------------------------------product 6 end
    {
        product_id: 7,
        size_id: 7,
        stock_QTY: 20,
        price: 2.5
    },
    {
        product_id: 7,         
        size_id: 8,
        stock_QTY: 20,
        price: 6.25                                #-------------sticker sizes---------
    },
    {
        product_id: 7,         
        size_id: 9,
        stock_QTY: 20,
        price: 12.34
    },
# ---------------------------------------------------product 7 end
    {
        product_id: 8,
        size_id: 7,
        stock_QTY: 20,
        price: 2.5
    },
    {
        product_id: 8,         
        size_id: 8,
        stock_QTY: 20,
        price: 6.25                                #-------------sticker sizes---------
    },
    {
        product_id: 8,         
        size_id: 9,
        stock_QTY: 20,
        price: 12.34
    },
# ---------------------------------------------------product 8 end
    {
        product_id: 9,
        size_id: 7,
        stock_QTY: 20,
        price: 2.5
    },
    {
        product_id: 9,         
        size_id: 8,
        stock_QTY: 20,
        price: 6.25                                #-------------sticker sizes---------
    },
    {
        product_id: 9,         
        size_id: 9,
        stock_QTY: 20,
        price: 12.34
    },
# ---------------------------------------------------product 9 end
    {
        product_id: 10,
        size_id: 7,
        stock_QTY: 20,
        price: 2.5
    },
    {
        product_id: 10,         
        size_id: 8,
        stock_QTY: 20,
        price: 6.25                                #-------------sticker sizes---------
    },
    {
        product_id: 10,         
        size_id: 9,
        stock_QTY: 20,
        price: 12.34
    },
# ---------------------------------------------------product 10 end
    {
        product_id: 11,
        size_id: 7,
        stock_QTY: 20,
        price: 2.5
    },
    {
        product_id: 11,         
        size_id: 8,
        stock_QTY: 20,
        price: 6.25                                #-------------sticker sizes---------
    },
    {
        product_id: 11,         
        size_id: 9,
        stock_QTY: 20,
        price: 12.34
    },
# ---------------------------------------------------product 11 end
    {
        product_id: 12,
        size_id: 7,
        stock_QTY: 20,
        price: 2.5
    },
    {
        product_id: 12,         
        size_id: 8,
        stock_QTY: 20,
        price: 6.25                                #-------------sticker sizes---------
    },
    {
        product_id: 12,         
        size_id: 9,
        stock_QTY: 20,
        price: 12.34
    },
# ---------------------------------------------------product 12 end
    {
        product_id: 13,
        size_id: 7,
        stock_QTY: 20,
        price: 2.5
    },
    {
        product_id: 13,         
        size_id: 8,
        stock_QTY: 20,
        price: 6.25                                #-------------sticker sizes---------
    },
    {
        product_id: 13,         
        size_id: 9,
        stock_QTY: 20,
        price: 12.34
    }
# ---------------------------------------------------product 13 end

]
product_variants.each do |variant|
    ProductVariant.create!(variant)
end