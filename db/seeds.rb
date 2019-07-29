


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

## NOW WE MAKE PROFILES FOR OUR ARTISTS
artist_profiles = [
    {
        username: "BlueBob",
        about: "i am an artist",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "bob@gmail.com").id
    },
    {
        username: "TurquoiseTom",
        about: "i am an artist",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "tom@gmail.com").id
    },
    {
        username: "AmberAmy",
        about: "i am an artist",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "amy@gmail.com").id
    }
]

artist_profiles.each do |artistprofile|
    Profile.create!(artistprofile)
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
        description: "This tee shows the gang together, 100% pure cotton",
        price: "$12.00",
        size: "XL",
        stock: 6,
        profile_id: User.find_by(email: "bob@gmail.com").profile.id,
        category_id: 1,
        fandom_id: 4
    },
    {
        name: "Jon Snow Artpiece",
        description: "framed art piece",
        price: "$22.00",
        size: "6\" x 10\"",
        stock: 5,
        profile_id: User.find_by(email: "bob@gmail.com").profile.id,
        category_id: 4,
        fandom_id: 12
    },
    {
        name: "Daenerys Artpiece",
        description: "framed art piece",
        price: "$25.00",
        size: "6\" x 10\"",
        stock: 4,
        profile_id: User.find_by(email: "tom@gmail.com").profile.id,
        category_id: 4,
        fandom_id: 12

    },
    {
        name: "Marvel Logo Hoodie",
        description: "hoodie, 100% alligator hide",
        price: "$15.00",
        size: "1000XL",
        stock: 20,
        profile_id: User.find_by(email: "tom@gmail.com").profile.id,
        category_id: 1,
        fandom_id: 1
    },
    {
        name: "Pokemon iPhone Case",
        description: "cool helmet",
        price: "$55.00",
        size: "big heads only",
        stock: 3,
        profile_id: User.find_by(email: "amy@gmail.com").profile.id,
        category_id: 3,
        fandom_id: 7
    },
    {
        name: "Jar Jar Binks on canvas",
        description: "painting of the iconic duo",
        price: "$115.00",
        size: "large",
        stock: 1,
        profile_id: User.find_by(email: "amy@gmail.com").profile.id,
        category_id: 4,
        fandom_id: 3 
    }
]

products.each do |product|
    Product.create!(product)
end



# NOTE: need to add fandom and category FK in product when seeding


