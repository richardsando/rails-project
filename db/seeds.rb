
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




### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




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





### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------





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
    






# ### ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------






# # CREATE A FEW MORE USERS WHO ARE ARTISTS and going to sell stuff on the site (that have the role of an artist [role_id = 2])

# # -----------------------------------------

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
    }, 
    {
        email: "moose@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "luci@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "deanluv@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "crowly@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "bros@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "jensen@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    }
]

artist_users.each do |artist|
    User.create!(artist)
end

## Now we have to change the role of our 'artist' users to have a role_id of 2.
## We cannot directly assign them a role_id of 2 when seeding the artist_users because we have set it up so they automatically
## get a role_id of 1 upon creation of the user


# So we have to find our users bob, tom and amy (because we want them to be our artists) and then change their role
artists_to_change = ["bob", "tom", "amy", "moose", "luci", "deanluv", "crowly", "bros", "jensen"]
artists_to_change.each do |name|
   User.find_by(email: "#{name}@gmail.com").update_attribute(:role_id, 2)
end


### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



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
    },
    {
        username: "moosllins",    
        about: "Moooose",
        location: "LA, America",
        joindate: Date.current,
        user_id: User.find_by(email: "moose@gmail.com").id
    },
    {
        username: "Laurcifers",    
        about: "Good morning Vietnam!!!",
        location: "Chicago, America",
        joindate: Date.current,
        user_id: User.find_by(email: "luci@gmail.com").id
    },
    {
        username: "Dean-luvs-pie",    
        about: "Hey, see if they've got any pie. Bring me some pie. I love me some pie.",
        location: "Portland, America",
        joindate: Date.current,
        user_id: User.find_by(email: "deanluv@gmail.com").id
    },
    {
        username: "corwlxy",    
        about: "No one in the history of torture's been tortured with torture like the torture you'll be tortured with.",
        location: "Philadelphia, America",
        joindate: Date.current,
        user_id: User.find_by(email: "crowly@gmail.com").id
    },
    {
        username: "doomed-brothers",    
        about: "'I've got demon blood in me, Dean!'' No. No you don't. You don't get to quit.",
        location: "LA, America",
        joindate: Date.current,
        user_id: User.find_by(email: "bros@gmail.com").id
    },
    {
        username: "JensenSnuggles",    
        about: "Pudding!!",
        location: "New York, America",
        joindate: Date.current,
        user_id: User.find_by(email: "jensen@gmail.com").id
    }
]

artist_profiles.each do |artistprofile|
    Profile.create!(artistprofile)
end

# Create wishlists and carts for the 6 users that we currently have
profile_ids = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
profile_ids.each do |id_num|
    Wishlist.create(profile_id: id_num)
    Cart.create(active_status: true, profile_id: id_num)
end


# ### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



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



# ### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


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

# ### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


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


fandoms.each do |fandom|
    Fandom.find_by(fandom: fandom[:fandom]).uploaded_image.purge
end



## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


## site inventory//
## bob owns the avengers t-shirt and jon snow artpiece
## tom own the daenerys artpiece and the marvel logo hoodie
## amy owns the minecraft creeper helmet and the rick and morty on canvas

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
    
    
    ### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
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
 
 
    #### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------








#### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


#### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# #--------------------------new-artist-users-----will add to above when happy!!!
artist_users = [
    {
        email: "wadie@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "lee4ever@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "oldschool@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "chibiplease@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "madie@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "bat@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "thedefender@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "waffles@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "exdemon@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "roamingbuffalo@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "mysticmayo@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "raven@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "mycroft@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "jake+cake@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "bubblegum24@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "drwhoian@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "drsong@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "watson@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "girlpower@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "stormtrooper@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "rebel@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "masterroshi@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    },
    {
        email: "walkerbite@gmail.com",
        password: "123456",
        password_confirmation: "123456"
    }
]

artist_users.each do |user|
    User.create!(user)
end


#### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# # --------------------------new-artist-profile-----will add to above when happy!!!
artist_profiles = [
    {
        username: "EpicWade",
        about: "'Deadpool is only a stage name'",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "wadie@gmail.com").id
    },
    {
        username: "lee4ever",
        about: "sing it'Stan by your man''spidypool'",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "lee4ever@gmail.com").id
    },
    {
        username: "OldSchool",
        about: "'kicking it way back'",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "oldschool@gmail.com").id
    },
    {
        username: "ChibiPlease",
        about: "'Oh! I KNOW you didn't just CHIBI say that!'",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "chibiplease@gmail.com").id
    },
    {
        username: "madnessisreality",
        about: "'We're bad guys that's what we do'",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "madie@gmail.com").id
    },
    {
        username: "batman_is_god",
        about: "'I'm Batman",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "bat@gmail.com").id
    },
    {
        username: "TheDefender",
        about: "Defenders the name, defence is the game",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "thedefender@gmail.com").id
    },
    {
        username: "Waffles",
        about: "I've Waffled before, I'll waffle again",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "waffles@gmail.com").id
    },
    {
        username: "exdemon",
        about: "lets use Christo to find out if theres any demons here",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "exdemon@gmail.com").id
    },
    {
        username: "RoamingBuffalo",
        about: "'Is that thunder?'",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "roamingbuffalo@gmail.com").id
    },
    {
        username: "Mysticmayo",
        about: "is the mayo mystical or is it a mystic",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "mysticmayo@gmail.com").id
    },
    {
        username: "Raven",
        about: "Teen Titans",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "raven@gmail.com").id
    },
    {
        username: "Mycorft",
        about: "'Hello Little Brother'",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "mycroft@gmail.com").id
    },
    {
        username: "Jack+Cake",
        about: "'Catnip, Sweet Babies'",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "jake+cake@gmail.com").id
    },
    {
        username: "Bubblegum24",
        about: "bp or lsp I perfer LSP but this just kinder happened...",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "bubblegum24@gmail.com").id
    },
    {
        username: "DR_Whoian",
        about: "'Now, WHERE is my sonic screwdriver!'",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "drwhoian@gmail.com").id
    },
    {
        username: "DR-x-Song",
        about: "'Hello Sweetie'",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "drsong@gmail.com").id
    },
    {
        username: "Watson",
        about: "We're not a couple!",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "watson@gmail.com").id
    },
    {
        username: "GirlPower",
        about: "Sunshine mixed with a little Hurricane",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "girlpower@gmail.com").id
    },
    {
        username: "Stormtrooper",
        about: "I know, I'm going back to target practice.",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "stormtrooper@gmail.com").id
    },
    {
        username: "Rebel",
        about: "I think I can handle myself",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "rebel@gmail.com").id
    },
    {
        username: "MasterRoshi",
        about: "'Passion very often makes the wisest men fools.'",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "masterroshi@gmail.com").id
    },
    {
        username: "Walkerbite",
        about: "'look, I like you but if Zombies chase us I'm tripping you",
        location: "Melbourne, Australia",
        joindate: Date.current,
        user_id: User.find_by(email: "walkerbite@gmail.com").id
    }
]

artist_profiles.each do |profile|
    Profile.create!(profile)
end


### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
marvel_products = [
    {
        name: "DeadPool comic style T-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "wadie@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 1 
    },
    {
        name: "'I am Groot' Deadpool T",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "wadie@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 1 
    },
    {
        name: "Doc Strange Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "wadie@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 1 
    },
    {
        name: "Iron Man Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "wadie@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 1 
    },
    {
        name: "Advengers Phone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "wadie@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 1 
    },
    {
        name: "'Everyone calls me Fury'",
        description: "Durable phone case",
        profile_id: User.find_by(email: "wadie@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 1 
    },
    {
        name: "Captain America Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "wadie@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 1 
    },
    {
        name: "Deadpool inspired fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "wadie@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 1 
    },
    {
        name: "Ant Man inspired fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "wadie@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 1 
    },####-------------------------------------------------------------------------------------------end of wadie
    {
        name: "Black Panther T-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "lee4ever@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 1 
    },
    {
        name: "Captain Marvel T-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "lee4ever@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 1 
    },
    {
        name: "Stan Lee Memorial T-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "lee4ever@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 1 
    },
    {
        name: "Captain Marvel Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "lee4ever@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 1 
    },
    {
        name: "Wolverine Phone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "lee4ever@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 1 
    },
    {
        name: "Ant Man Phone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "lee4ever@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 1 
    },
    {
        name: "Black Panther Print",
        description: "print/wall art",
        profile_id: User.find_by(email: "lee4ever@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 1 
    },
    {
        name: "Marvel Studios Poster",
        description: "print/wall art",
        profile_id: User.find_by(email: "lee4ever@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 1 
    },
    {
        name: "Marvel inspired fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "lee4ever@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 1 
    },####--------------------------------------------------------------------------------------------end of lee4ever
    {
        name: "Amazing Spider-Man",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 1 
    },
    {
        name: "Bule Marvel T-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 1 
    },
    {
        name: "Comic-book Marvel Characters",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 1 
    },
    {
        name: "'you are our super hero'",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 1 
    },
    {
        name: "Captain America T-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 1 
    },
    {
        name: "Captain Marvel",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 1 
    },
    {
        name: "Comics of Marvel Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 1 
    },
    {
        name: "Spider Man comic styled",
        description: "Durable phone case",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 1 
    },
    {
        name: "Captain America Phone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 1 
    },
    {
        name: "Guardians of the Galaxy Print",
        description: "print/wall art",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 1 
    },
    {
        name: "Iron man and the Advengers",
        description: "print/wall art",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 1 
    },
    {
        name: "Deadpool and Cable fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 1 
    },
    {
        name: "Spider-Man City Poster",
        description: "print/wall art",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 1 
    },
    {
        name: "Captain America fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 1 
    },####------------------------------------------------------------------------------------------end of oldschool
    {
        name: "'Loki!! Marvel tee",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "wadie@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 1 
    },
    {
        name: "Spider-Man and Spider logo",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "wadie@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 1 
    },
    {
        name: "Thanos Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "wadie@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 1 
    },
    {
        name: "Star Lord iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "wadie@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 1 
    },
    {
        name: "Chibi Spider-Man Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "wadie@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 1 
    },
    {
        name: "Guardians of the Galaxy Vol 2",
        description: "print/wall art",
        profile_id: User.find_by(email: "wadie@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 1 
    }####------------------------------------------------------------------------------------------end of chibiplease
]

marvel_products.each do |product|
    Product.create!(product)
end


image_names = ["marvel-tee-4.jpg", "marvel-tee-6.jpg", "marvel-stickers-1.jpg", "marvel-sticker-7.jpg", "marvel-iphone-3.jpg", "marvel-iphone-6.jpg", "marvel-iphone-4.jpeg", "marvel-print-1.jpg", "marvel-print-12.jpg",####---end of wadie
"marvel-tee-11.jpg", "marvel-tee-7.jpg", "marvel-tee-10.jpg", "marvel-sticker-2.jpg", "marvel-iphone-8.jpg", "marvel-iphone-9.jpg", "marvel-print-5.jpg", "marvel-print-4.jpg", "marvel-print-8.jpg",####---end of lee4ever
 "marvel-tee-9.jpg", "marvel-tee-3.jpeg", "marvel-tee-1.jpg", "marvel-tee-2.jpeg", "marvel-tee-5.jpg", "marvel-sticker-4.jpg", "marvel-iphone-1.jpg", "marvel-iphone-7.jpg", "marvel-iphone-5.jpg", "marvel-print-6.jpg", "marvel-print-2.jpg", "marvel-print-9.jpg", "marvel-print-7.jpg", "marvel-print-3.jpg",####---end of oldschool
 "marvel-tee-8.jpg", "marvel-sticker-6.jpg", "marvel-sticker-9.jpg", "marvel-iphone-10.jpg", "marvel-iphone-2.jpg", "marvel-print-10.jpg"####---end of Chibiplease
]
###------------------------------------CHECK THE COMMERS--------------------------------------

product_names = ["DeadPool comic style T-shirt", "'I am Groot' Deadpool T", "Doc Strange Sticker", "Iron Man Sticker", "Advengers Phone Case", "'Everyone calls me Fury'", "Captain America Case", "Deadpool inspired fan art", "Ant Man inspired fan art",####---end of wadie
"Black Panther T-shirt", "Captain Marvel T-shirt", "Stan Lee Memorial T-shirt", "Captain Marvel Sticker", "Wolverine Phone Case", "Ant Man Phone Case", "Black Panther Print", "Marvel Studios Poster", "Marvel inspired fan art",####---end of lee4ever
 "Amazing Spider-Man", "Bule Marvel T-shirt", "Comic-book Marvel Characters", "'you are our super hero'", "Captain America T-shirt", "Captain Marvel", "Comics of Marvel Case", "Spider Man comic styled", "Captain America Phone Case", "Guardians of the Galaxy Print", "Iron man and the Advengers", "Deadpool and Cable fan art", "Spider-Man City Poster", "Captain America fan art",####---end of oldschool
 "'Loki!! Marvel tee", "Spider-Man and Spider logo", "Thanos Sticker", "Star Lord iPhone Case", "Chibi Spider-Man Case", "Guardians of the Galaxy Vol 2"####---end of Chibiplease
]

zip = image_names.zip(product_names)

zip.each do |img_name, product_name|
    path = Rails.root.join("app", "assets", "images", img_name)
    Product.find_by(name: product_name).uploaded_image.attach(io: File.open(path), filename: img_name)
end












#### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#### -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------








dc_products = [
    {
        name: "Superman T-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 2 
    },
    {
        name: "Mr Freeze T-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 2 
    },
    {
        name: "Batman comic style Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 2 
    },
    {
        name: "Last Son of Krypton",
        description: "Durable phone case",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 2 
    },
    {
        name: "Superman iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 2 
    },
    {
        name: "The Flash iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 2 
    },
    {
        name: "Green Arrow fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 2 
    },
    {
        name: "Metropolis City Print",
        description: "print/wall art",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 2 
    },
    {
        name: "The Flash Comic Print",
        description: "print/wall art",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 2 
    },
    {
        name: "Batman Comic Print",
        description: "print/wall art",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 2 
    },####------------------------------------------------------------------------------------------end of oldschool
    {
        name: "Superman Sticker!!",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 2 
    },
    {
        name: "Smooshed Batman Phone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 2 
    },####-----------------------------------------------------------------------------------------end of chibiplease
    {
        name: "Joker Suicide Squad T",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "madie@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 2 
    },
    {
        name: "Catwoman T-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "madie@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 2 
    },
    {
        name: "Catwoman and Joker T",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "madie@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 2 
    },
    {
        name: "Harley Quinn Sticker!",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "madie@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 2 
    },
    {
        name: "Catwoman Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "madie@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 2 
    },
    {
        name: "Oswald's Club Symbol",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "madie@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 2 
    },
    {
        name: "Joker Sticker!!",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "madie@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 2 
    },
    {
        name: "The Scream 'Joker and Batsy'",
        description: "Durable phone case",
        profile_id: User.find_by(email: "madie@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 2 
    },
    {
        name: "Catwoman Wallart",
        description: "print/wall art",
        profile_id: User.find_by(email: "madie@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 2 
    },
    {
        name: "Harley Quinn and The Joker Print",
        description: "print/wall art",
        profile_id: User.find_by(email: "madie@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 2 
    },####-----------------------------------------------------------------------------------------------end of madie
    {
        name: "Nightwing T-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "bat@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 2 
    },
    {
        name: "Justice League T-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "bat@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 2 
    },
    {
        name: "Penguin Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "bat@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 2 
    },
    {
        name: "Batsy Slaping Superman",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "bat@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 2 
    },
    {
        name: "Batman comic style Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "bat@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 2 
    },
    {
        name: "Wayne Industries",
        description: "Durable phone case",
        profile_id: User.find_by(email: "bat@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 2 
    },
    {
        name: "Batman 'Edgy' iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "bat@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 2 
    },
    {
        name: "Red Hood iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "bat@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 2 
    },
    {
        name: "Deathstroke iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "bat@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 2 
    },
    {
        name: "Batman x Joker Print",
        description: "print/wall art",
        profile_id: User.find_by(email: "bat@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 2 
    },
    {
        name: "Batman x Joker 'Lego' Print",
        description: "print/wall art",
        profile_id: User.find_by(email: "bat@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 2 
    }####--------------------------------------------------------------------------------------------------end of bat
]

dc_products.each do |product|
    Product.create!(product)
end


image_names = ["dc-tee-3.jpeg", "dc-tee-7.jpeg", "dc-iphonecase-1.jpg", "dc-iphonecase-7.jpg", "dc-iphonecase-10.jpg", "dc-iphonecase-2.jpg", "dc-prints-6.jpg", "dc-prints-2.jpg", "dc-prints-3.jpg", "dc-prints-7.jpg",####----end of oldschool
 "dc-sticker-9.jpg", "dc-iphonecase-9.jpg",####----end of chibiplease
 "dc-tee-5.jpg", "dc-tee-6.jpg", "dc-tee-4.jpg", "dc-sticker-1.jpg", "dc-sticker-4.jpg", "dc-sticker-8.jpg", "dc-sticker-2.jpg", "dc-iphonecase-5.jpg", "dc-prints-8.jpg", "dc-prints-5.jpg",####----end of madie
 "dc-tee-2.jpg", "dc-tee-8.jpg", "dc-sticker-7.jpeg", "dc-sticker-5.jpg", "dc-sticker-3.jpeg", "dc-iphonecase-11.jpg", "dc-iphonecase-3.jpg", "dc-iphonecase-4.jpg", "dc-iphonecase-6.jpg", "dc-prints-10.jpg", "dc-prints-11.jpg"####----end of bat
]


product_names = ["Superman T-shirt", "Mr Freeze T-shirt", "Batman comic style Case", "Last Son of Krypton", "Superman iPhone Case", "The Flash iPhone Case", "Green Arrow fan art", "Metropolis City Print", "The Flash Comic Print", "Batman Comic Print",####----end of oldschool
 "Superman Sticker!!", "Smooshed Batman Phone Case",####----end of chibiplease
 "Joker Suicide Squad T", "Catwoman T-shirt", "Catwoman and Joker T", "Harley Quinn Sticker!", "Catwoman Sticker", "Oswald's Club Symbol", "Joker Sticker!!", "The Scream 'Joker and Batsy'", "Catwoman Wallart", "Harley Quinn and The Joker Print",####----end of madie
 "Nightwing T-shirt", "Justice League T-shirt", "Penguin Sticker", "Batsy Slaping Superman", "Batman comic style Sticker", "Wayne Industries", "Batman 'Edgy' iPhone Case", "Red Hood iPhone Case", "Deathstroke iPhone Case", "Batman x Joker Print", "Batman x Joker 'Lego' Print"####----end of bat
]

zip = image_names.zip(product_names)

zip.each do |img_name, product_name|
    path = Rails.root.join("app", "assets", "images", img_name)
    Product.find_by(name: product_name).uploaded_image.attach(io: File.open(path), filename: img_name)
end



















starwars_products = [
    {
        name: "Wicked Yoda T-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "lee4ever@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 3 
    },
    {
        name: "'your father' Darth Vader T",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "lee4ever@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 3 
    },
    {
        name: "Darth Vader Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "lee4ever@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 3 
    },
    {
        name: "Darth Vader iphone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "lee4ever@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 3 
    },
    {
        name: "Star Wars IX inspired poster",
        description: "print/wall art",
        profile_id: User.find_by(email: "lee4ever@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 3 
    },
    {
        name: "Kylo Ren vs Rey fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "lee4ever@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 3 
    },####--------------------------------------------------------------------------------------------end of lee4ever
    {
        name: "'Like a BossK' Star Wars T",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 3 
    },
    {
        name: "Jabba the Hutt Star Wars T",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 3 
    },
    {
        name: "'Almost there' Star Wars",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 3 
    },
    {
        name: "R2-D2 Star Wars",
        description: "Durable phone case",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 3 
    },
    {
        name: "Star Wars 'The Original' Poster",
        description: "print/wall art",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 3 
    },
    {
        name: "Millennium Falcon Blueprint Poster",
        description: "print/wall art",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 3 
    }####------------------------------------------------------------------------------------------end of oldschool
]

starwars_products.each do |product|
    Product.create!(product)
end





image_names = ["starwars-tees-7.jpg", "starwars-tees-10.jpg", "starwars-stickers-3.jpg", "starwars-iphonecase-6.jpeg", "starwars-prints-11.jpg", "starwars-prints-9.jpg",####---end of lee4ever
 "starwars-tees-4.jpg", "starwars-tees-3.jpg", "starwars-stickers-10.png", "starwars-iphonecase-2.jpeg", "starwars-prints-4.jpg", "starwars-prints-8.jpg",####---end of oldschool
]

product_names = ["Wicked Yoda T-shirt", "'your father' Darth Vader T", "Darth Vader Sticker", "Darth Vader iphone Case", "Star Wars IX inspired poster", "Kylo Ren vs Rey fan art",####---end of lee4ever
"'Like a BossK' Star Wars T", "Jabba the Hutt Star Wars T", "'Almost there' Star Wars", "R2-D2 Star Wars", "Star Wars 'The Original' Poster", "Millennium Falcon Blueprint Poster",####---end of oldschool
]



zip = image_names.zip(product_names)

zip.each do |img_name, product_name|
    path = Rails.root.join("app", "assets", "images", img_name)
    Product.find_by(name: product_name).uploaded_image.attach(io: File.open(path), filename: img_name)
end














drwho_products = [
    {
        name: "DR Who + Sherlock T-Shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "mycroft@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 4 
    },
    {
        name: "DR Who SuperWhoLock iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "mycroft@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 4 
    },####-----------------------------------------------------------------------------------------------mycroft
    {
        name: "DR Who 'Bow Ties are Cool' T-Shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "drwhoian@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 4 
    },
    {
        name: "DR Who Regeneration T-Shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "drwhoian@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 4 
    },
    {
        name: "Dr Who 'multible' Stickers",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "drwhoian@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 4 
    },
    {
        name: "DR Who Police Box iPhone Case c",
        description: "Durable phone case",
        profile_id: User.find_by(email: "drwhoian@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 4 
    },
    {
        name: "DR Who 'moon landing' iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "drwhoian@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 4 
    },
    {
        name: "Dr Who 'Never Crul' Print",
        description: "print/wall art",
        profile_id: User.find_by(email: "drwhoian@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 4
    },
    {
        name: "The Doctors 50th anniversary print",
        description: "print/wall art",
        profile_id: User.find_by(email: "drwhoian@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 4
    },
    {
        name: "Dr Who 'Jon Pertwee + Peter Capaldi' Poster",
        description: "print/wall art",
        profile_id: User.find_by(email: "drwhoian@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 4
    },
    {
        name: "Dr Who 'Geromimo'(Matt Smith) Poster",
        description: "print/wall art",
        profile_id: User.find_by(email: "drwhoian@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 4
    }####---------------------------------------------------------------------------------------drwhoian
]

drwho_products.each do |product|
    Product.create!(product)
end


image_names = ["dr-who-tee-9.jpg", "dr-who-iphonecase-5.jpg",####----mycroft
 "dr-who-tee-8.jpg", "dr-who-tee-10.png", "dr-who-stickers-1.jpeg", "dr-who-iphonecase-3.jpg", "dr-who-iphonecase-4.jpg", "dr-who-print-1.jpg", "dr-who-print-5.jpg", "dr-who-print-7.jpg", "dr-who-print-10.jpg"####----whoian
]


product_names = ["DR Who + Sherlock T-Shirt", "DR Who SuperWhoLock iPhone Case",####----mycroft
"DR Who 'Bow Ties are Cool' T-Shirt", "DR Who Regeneration T-Shirt", "Dr Who 'multible' Stickers", "DR Who Police Box iPhone Case c", "DR Who 'moon landing' iPhone Case", "Dr Who 'Never Crul' Print", "The Doctors 50th anniversary print", "Dr Who 'Jon Pertwee + Peter Capaldi' Poster", "Dr Who 'Geromimo'(Matt Smith) Poster"####----whoian
]

zip = image_names.zip(product_names)

zip.each do |img_name, product_name|
    path = Rails.root.join("app", "assets", "images", img_name)
    Product.find_by(name: product_name).uploaded_image.attach(io: File.open(path), filename: img_name)
end













thewalkingdead_products = [
    {
        name: "Rick Grimes T",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "bat@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 5 
    },
    {
        name: "Lucille TWD T-Shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "bat@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 5 
    },
    {
        name: "Rick Grimes Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "bat@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 5 
    },
    {
        name: "The Sheriff Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "bat@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 5 
    },
    {
        name: "TWD Sheriff iphone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "bat@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 5 
    },
    {
        name: "Swinging Peice of Bait poster",
        description: "print/wall art",
        profile_id: User.find_by(email: "bat@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 5 
    },
    {
        name: "TWD Sheriff inspired poster",
        description: "print/wall art",
        profile_id: User.find_by(email: "bat@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 5 
    }, 
    {
        name: "TWD Easy Street Print",
        description: "print/wall art",
        profile_id: User.find_by(email: "bat@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 5 
    },####-----------------------------------------------------------------------------------------------------bat
    {
        name: "Rick Grimes 'Fight the Dead'",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "bubblegum24@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 5 
    },
    {
        name: "'This isn't a Democracy' TWD T-Shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "bubblegum24@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 5 
    },
    {
        name: "The-Walking-Dead T-Shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "bubblegum24@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 5 
    },
    {
        name: "The-Walking-Dead 'Sticker'",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "bubblegum24@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 5 
    },
    {
        name: "Team Daryl Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "bubblegum24@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 5 
    },
    {
        name: "The Walking Dead, iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "bubblegum24@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 5 
    },
    {
        name: "TWD b/w/r iphone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "bubblegum24@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 5 
    },
    {
        name: "TWD Inspired iphone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "bubblegum24@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 5 
    },
    {
        name: "The Walking Dead, fan inspired poster",
        description: "print/wall art",
        profile_id: User.find_by(email: "bubblegum24@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 5 
    },
    {
        name: "The Walking Dead inspired poster G/P",
        description: "print/wall art",
        profile_id: User.find_by(email: "bubblegum24@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 5 
    }, 
    {
        name: "The Walking Dead Inspired Poster B/P",
        description: "print/wall art",
        profile_id: User.find_by(email: "bubblegum24@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 5 
    }####---------------------------------------------------------------------------------------------------Bubble

]

thewalkingdead_products.each do |product|
    Product.create!(product)
end


image_names = ["thewalkingdead-tee-8.jpeg", "thewalkingdead-tee-5.jpg", "thewalkingdead-stickers-7.jpg", "thewalkingdead-stickers-5.jpg", "thewalkingdead-iphonecase-5.jpg", "thewalkingdead-prints-6.jpg", "thewalkingdead-prints-4.jpg", "thewalkingdead-prints-10.jpg",###----bat
 "thewalkingdead-tee-3.jpg", "thewalkingdead-tee-7.png", "thewalkingdead-tee-9.jpg", "thewalkingdead-stickers-3.jpg", "thewalkingdead-stickers-8.jpg", "thewalkingdead-iphonecase-8.jpg", "thewalkingdead-prints-1.jpg", "thewalkingdead-iphonecase-4.jpg", "thewalkingdead-prints-3.jpg", "thewalkingdead-prints-8.jpeg", "thewalkingdead-prints-11.jpg"####----bubble
]


product_names = ["Rick Grimes T", "Lucille TWD T-Shirt", "Rick Grimes Sticker", "The Sheriff Sticker", "TWD Sheriff iphone Case", "Swinging Peice of Bait poster", "TWD Sheriff inspired poster", "TWD Easy Street Print",###---bat
"Rick Grimes 'Fight the Dead'", "'This isn't a Democracy' TWD T-Shirt", "The-Walking-Dead T-Shirt", "The-Walking-Dead 'Sticker'", "Team Daryl Sticker", "The Walking Dead, iPhone Case", "TWD b/w/r iphone Case", "TWD Inspired iphone Case", "The Walking Dead, fan inspired poster", "The Walking Dead inspired poster G/P", "The Walking Dead Inspired Poster B/P"####----bubble
]

zip = image_names.zip(product_names)

zip.each do |img_name, product_name|
    path = Rails.root.join("app", "assets", "images", img_name)
    Product.find_by(name: product_name).uploaded_image.attach(io: File.open(path), filename: img_name)
end














    spn_products = [
    {
        name: "Supernatural Dean tee",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "moose@gmail.com").profile.id,
        category_id: 1,
        fandom_id: 6 
    },
    {
        name: "Destoryed social life t-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "moose@gmail.com").profile.id,
        category_id: 1,
        fandom_id: 6 
    },
    {
        name: "I'm going hunting t-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "moose@gmail.com").profile.id,
        category_id: 1,
        fandom_id: 6 
    },
    {
        name: "Run like you crashed the implara t-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "moose@gmail.com").profile.id,
        category_id: 1,
        fandom_id: 6 
    },
    {
        name: "Stick hope that pie was worth it",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "moose@gmail.com").profile.id,
        category_id: 2,
        fandom_id: 6 
    },
    {
        name: "Supernatural Sam's shoe iPhone case",
        description: "Durable phone case, qoute from show",
        profile_id: User.find_by(email: "moose@gmail.com").profile.id,
        category_id: 3,
        fandom_id: 6 
    },
    {
        name: "Supernatural Cas get down here",
        description: "Durable phone case, qoute from show",
        profile_id: User.find_by(email: "moose@gmail.com").profile.id,
        category_id: 3,
        fandom_id: 6 
    },
    {
        name: "Supernatural Destiel",
        description: "Durable phone case, image of cas and dean",
        profile_id: User.find_by(email: "moose@gmail.com").profile.id,
        category_id: 3,
        fandom_id: 6 
    },####----------------------------------------------------------------------end of moose
    {
        name: "SPN Driver picks the music T-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "luci@gmail.com").profile.id,
        category_id: 1,
        fandom_id: 6 
    },
    {
        name: "Sticker SPN driver picks the music",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "luci@gmail.com").profile.id,
        category_id: 2,
        fandom_id: 6 
    },
    {
        name: "Sticker SPN Men of Letters",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "luci@gmail.com").profile.id,
        category_id: 2,
        fandom_id: 6 
    },
    {
        name: "sticker SPN family dosn't end with blood",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "luci@gmail.com").profile.id,
        category_id: 2,
        fandom_id: 6 
    },
    {
        name: "SPN inspired iPhone case",
        description: "Durable phone case, qoute from show",
        profile_id: User.find_by(email: "luci@gmail.com").profile.id,
        category_id: 3,
        fandom_id: 6 
    },####----------------------------------------------------------------------end of luci 
    {
        name: "SPN Sold my soul t-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "deanluv@gmail.com").profile.id,
        category_id: 1,
        fandom_id: 6 
    },
    {
        name: "Team Dean",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "deanluv@gmail.com").profile.id,
        category_id: 2,
        fandom_id: 6 
    },
    {
        name: "love me some pie sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "deanluv@gmail.com").profile.id,
        category_id: 2,
        fandom_id: 6 
    },
    {
        name: "who gripped you tight",
        description: "Durable phone case",
        profile_id: User.find_by(email: "deanluv@gmail.com").profile.id,
        category_id: 3,
        fandom_id: 6 
    },
    {
        name: "'My people skills are Rusty'",
        description: "Durable phone case",
        profile_id: User.find_by(email: "deanluv@gmail.com").profile.id,
        category_id: 3,
        fandom_id: 6 
    },
    {
        name: "Supernatural iPhone case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "deanluv@gmail.com").profile.id,
        category_id: 4,
        fandom_id: 6 
    },
    {
        name: "Castiel print from SPN",
        description: "print/wall art",
        profile_id: User.find_by(email: "deanluv@gmail.com").profile.id,
        category_id: 4,
        fandom_id: 6 
    },
    {
        name: "Keep calm SPN Poster",
        description: "print/wall art",
        profile_id: User.find_by(email: "deanluv@gmail.com").profile.id,
        category_id: 4,
        fandom_id: 6 
    },####----------------------------------------------------------------------end of deanluv
    {
        name: "SPN Make Hell Great Again",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "crowly@gmail.com").profile.id,
        category_id: 1,
        fandom_id: 6 
    },
    {
        name: "The Daringest Devil",
        description: "Durable phone case",
        profile_id: User.find_by(email: "crowly@gmail.com").profile.id,
        category_id: 3,
        fandom_id: 6 
    },
    {
        name: "Crowley SPN",
        description: "Durable phone case",
        profile_id: User.find_by(email: "crowly@gmail.com").profile.id,
        category_id: 3,
        fandom_id: 6 
    },
    {
        name: "Saving People, Hunting Things",
        description: "print/wall art",
        profile_id: User.find_by(email: "crowly@gmail.com").profile.id,
        category_id: 4,
        fandom_id: 6 
    },
    {
        name: "Join the Hunt SPN",
        description: "print/wall art",
        profile_id: User.find_by(email: "crowly@gmail.com").profile.id,
        category_id: 4,
        fandom_id: 6 
    },
    {
        name: "Shadow Supernatural",
        description: "print/wall art",
        profile_id: User.find_by(email: "crowly@gmail.com").profile.id,
        category_id: 4,
        fandom_id: 6 
    },
    {
        name: "SPN Join the hunt 'saving people'",
        description: "print/wall art",
        profile_id: User.find_by(email: "crowly@gmail.com").profile.id,
        category_id: 4,
        fandom_id: 6 
    },
    {
        name: "Supernatural 'seeing red'",
        description: "print/wall art",
        profile_id: User.find_by(email: "crowly@gmail.com").profile.id,
        category_id: 4,
        fandom_id: 6 
    },
    {
        name: "Supernatural inspired fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "crowly@gmail.com").profile.id,
        category_id: 4,
        fandom_id: 6 
    },####----------------------------------------------------------------------end of crowly
    {
        name: "Cursed Child T-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "bros@gmail.com").profile.id,
        category_id: 1,
        fandom_id: 6 
    },
    {
        name: "Team Free Will SPN",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "bros@gmail.com").profile.id,
        category_id: 1,
        fandom_id: 6 
    }, 
    {
        name: "Protected by Winchester Bros",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "bros@gmail.com").profile.id,
        category_id: 1,
        fandom_id: 6 
    }, 
    {
        name: "Salt it Burn it SPN",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "bros@gmail.com").profile.id,
        category_id: 1,
        fandom_id: 6 
    },
    {
        name: "Saving people hunting things",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "bros@gmail.com").profile.id,
        category_id: 2,
        fandom_id: 6 
    },
    {
        name: "The family Business",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "bros@gmail.com").profile.id,
        category_id: 2,
        fandom_id: 6 
    }, 
    {
        name: "Got Salt? SPN",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "bros@gmail.com").profile.id,
        category_id: 2,
        fandom_id: 6 
    },
    {
        name: "Supernatural Chibi case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "bros@gmail.com").profile.id,
        category_id: 3,
        fandom_id: 6 
    },
    {
        name: "Save peolpe hunt things SPN",
        description: "Durable phone case",
        profile_id: User.find_by(email: "bros@gmail.com").profile.id,
        category_id: 3,
        fandom_id: 6 
    },####----------------------------------------------------------------------end of bros 
    {
        name: "Lil Cassie T-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "jensen@gmail.com").profile.id,
        category_id: 1,
        fandom_id: 6 
    },
    {
        name: "Supernatural time!!",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "jensen@gmail.com").profile.id,
        category_id: 2,
        fandom_id: 6 
    },
    {
        name: "Lil angel Cassie",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "jensen@gmail.com").profile.id,
        category_id: 2,
        fandom_id: 6 
    }, 
    {
        name: "Spoopernatural",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "jensen@gmail.com").profile.id,
        category_id: 2,
        fandom_id: 6 
    },
    {
        name: "SPN iPhone case Chibi",
        description: "Durable phone case",
        profile_id: User.find_by(email: "jensen@gmail.com").profile.id,
        category_id: 3,
        fandom_id: 6 
    },
    {
        name: "Scoobynatural inspired fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "jensen@gmail.com").profile.id,
        category_id: 4,
        fandom_id: 6 
    },
    {
        name: "Impala Rules",
        description: "print/wall art",
        profile_id: User.find_by(email: "jensen@gmail.com").profile.id,
        category_id: 4,
        fandom_id: 6 
    },
    {
        name: "Destiel Supernatural",
        description: "print/wall art",
        profile_id: User.find_by(email: "jensen@gmail.com").profile.id,
        category_id: 4,
        fandom_id: 6 
    },
    {
        name: "Supernatural Time! fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "jensen@gmail.com").profile.id,
        category_id: 4,
        fandom_id: 6 
    }####----------------------------------------------------------------------end of jensen
]

spn_products.each do |product|
    Product.create!(product)
end


image_names = ["supernatural-tee-2.jpg", "supernatural-tee-3.jpg", "supernatural-tee-4.jpg", "supernatural-tee-5.jpg", "supernatural-sticker-4.jpg", "supernatural-iphonecase-2.jpg", "supernatural-iphonecase-9.jpg", "supernatural-iphonecase-12.jpg", "supernatural-tee-1.jpg", "supernatural-sticker-3.jpg", "supernatural-sticker-10.jpg", "supernatural-sticker-11.jpg", "supernatural-iphonecase-8.jpg", "supernatural-tee-10.jpg", "supernatural-sticker-9.jpg", "supernatural-sticker-2.jpg", "supernatural-iphonecase-5.jpg", "supernatural-iphonecase-3.jpg", "supernatural-iphonecase-4.jpg", "supernatural-print-12.jpg", "supernatural-print-11.jpg", "supernatural-tee-11.jpg", "supernatural-iphonecase-10.jpg", "supernatural-iphonecase-6.jpg", "supernatural-print-8.png", "supernatural-print-7.jpg", "supernatural-print-10.jpg", "supernatural-print-1.jpg", "supernatural-print-2.jpg", "supernatural-print-3.jpg", "supernatural-tee-8.jpg", "supernatural-tee-6.jpg", "supernatural-tee-12.jpg", "supernatural-tee-7.jpg", "supernatural-sticker-8.jpg", "supernatural-sticker-1.jpg", "supernatural-sticker-7.jpg", "supernatural-iphonecase-7.jpg", "supernatural-iphonecase-1.jpg", "supernatural-tee-9.jpg", "supernatural-sticker-12.jpg", "supernatural-sticker-6.jpg", "supernatural-sticker-5.jpg", "supernatural-iphonecase-11.jpg", "supernatural-print-6.jpg", "supernatural-print-9.jpg", "supernatural-print-4.jpg", "supernatural-print-5.jpg"]
product_names = ["Supernatural Dean tee", "Destoryed social life t-shirt", "I'm going hunting t-shirt", "Run like you crashed the implara t-shirt", "Stick hope that pie was worth it", "Supernatural Sam's shoe iPhone case", "Supernatural Cas get down here", "Supernatural Destiel", "SPN Driver picks the music T-shirt", "Sticker SPN driver picks the music", "Sticker SPN Men of Letters", "sticker SPN family dosn't end with blood", "SPN inspired iPhone case", "SPN Sold my soul t-shirt", "Team Dean", "love me some pie sticker", "who gripped you tight", "'My people skills are Rusty'", "Supernatural iPhone case", "Castiel print from SPN", "Keep calm SPN Poster", "SPN Make Hell Great Again", "The Daringest Devil", "Crowley SPN", "Saving People, Hunting Things", "Join the Hunt SPN", "Shadow Supernatural", "SPN Join the hunt 'saving people'", "Supernatural 'seeing red'", "Supernatural inspired fan art", "Cursed Child T-shirt", "Team Free Will SPN", "Protected by Winchester Bros", "Salt it Burn it SPN", "Saving people hunting things", "The family Business", "Got Salt? SPN", "Supernatural Chibi case", "Save peolpe hunt things SPN", "Lil Cassie T-shirt", "Supernatural time!!", "Lil angel Cassie", "Spoopernatural", "SPN iPhone case Chibi", "Scoobynatural inspired fan art", "Impala Rules", "Destiel Supernatural", "Supernatural Time! fan art"]

zip = image_names.zip(product_names)

zip.each do |img_name, product_name|
    path = Rails.root.join("app", "assets", "images", img_name)
    Product.find_by(name: product_name).uploaded_image.attach(io: File.open(path), filename: img_name)
end



















pokemon_products = [
    {
        name: "'You could say it's Electrifying'",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "wadie@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 7 
    },
    {
        name: "'Pika Pikachu' Deadpool T",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "wadie@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 7 
    },
    {
        name: "'Poke Ball' Pokemon Tee",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "wadie@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 7 
    },####-------------------------------------------------------------------------------------------end of wadie
    {
        name: "Pokemon 'Lapras' inspired fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "lee4ever@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 7 
    },
    {
        name: "Pokemon Go inspired fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "lee4ever@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 7 
    },
    {
        name: "Pokemon 'Catch 'em All' fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "lee4ever@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 7 
    },####-------------------------------------------------------------------------------------------end of lee4ever
    {
        name: "Zorua Pokemon Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 7
    },
    {
        name: "Pokemon Pals Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 7
    },
    {
        name: "Sandshrew Pokemon Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 7
    },
    {
        name: "Bulbasaur Pokemon Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 7
    },
    {
        name: "Psyduck Pokemon Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 7
    },
    {
        name: "Leafon Pokemon Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 7
    },
    {
        name: "Magikarp Shiny Pokemon Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 7
    },
    {
        name: "Meowth Pokemon Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 7
    },
        {
        name: "Chandelure Pokemon Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 7
    },
    {
        name: "Sandshrew iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 7 
    },
    {
        name: "Pokemon pals iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 7 
    },
    {
        name: "Pokemon cute iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 7 
    },
    {
        name: "Goomy Pokemon iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 7 
    },
    {
        name: "Poke Ball inspired print",
        description: "print/wall art",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 7 
    },
    {
        name: "Squirtle inspired print",
        description: "print/wall art",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 7 
    },####----------------------------------------------------------------------------------------end of chibiplease
    {
        name: "'Pokemon Always Stand By You'",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 7 
    },
    {
        name: "Charmander evolutions",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 7 
    },
    {
        name: "'Besties Forever' Pokemon Tee",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 7 
    },
    {
        name: "Nija Pokemon T-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 7 
    },
    {
        name: "'Kodoku' Pokemon Tee",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 7 
    },
    {
        name: "Charizard Pokemon Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 7
    },
    {
        name: "Ash and friends Pokemon Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 7
    },
    {
        name: "Pokemon Rick and Morty Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 7 
    },
    {
        name: "Pokemon Team instinct iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 7 
    },
    {
        name: "Quilava iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 7 
    },
    {
        name: "Pokemon Red print",
        description: "print/wall art",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 7 
    },
    {
        name: "Pokemon Sapphire print",
        description: "print/wall art",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 7 
    },####-----------------------------------------------------------------------------------------------roamingbuff
    {
        name: "Pokemon Haunter iPhone case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 7 
    },
    {
        name: "Pokemon Haunter Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 7 
    },
    {
        name: "Pokemon Pikachu b/w fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 7 
    },
    {
        name: "Pokemon Psychic fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 7 
    }####------------------------------------------------------------------------------------------------------mayo
]

pokemon_products.each do |product|
    Product.create!(product)
end


image_names = ["pokemon-tee-1.jpg", "pokemon-tee-4.jpg", "pokemon-tee-5.jpg",####---end of wadie
 "pokemon-print-8.jpg", "pokemon-print-9.jpg", "pokemon-print-7.jpg",####---end of lee4ever
 "pokemon-stickers-5.jpg", "pokemon-stickers-7.jpg", "pokemon-stickers-10.jpg", "pokemon-stickers-1.jpg", "pokemon-stickers-2.jpg", "pokemon-stickers-12.jpg", "pokemon-stickers-6.jpg", "pokemon-stickers-11.jpg", "pokemon-stickers-4.jpg", "pokemon-iphone-4.jpg", "pokemon-iphone-3.jpg", "pokemon-iphone-1.jpg", "pokemon-iphone-11.jpeg", "pokemon-print-2.jpg", "pokemon-print-3.jpg",####---end of chibiplease
 "pokemon-tee-12.jpg", "pokemon-tee-10.jpg", "pokemon-tee-9.jpg", "pokemon-tee-8.jpg", "pokemon-tee-6.jpg", "pokemon-stickers-3.jpg", "pokemon-stickers-8.jpg", "pokemon-iphone-5.jpg", "pokemon-iphone-6.jpg", "pokemon-iphone-7.jpg", "pokemon-print-10.jpg", "pokemon-print-1.jpg",####----Roaming buff
 "pokemon-iphone-8.jpg", "pokemon-iphone-9.jpg", "pokemon-print-4.jpg", "pokemon-print-6.jpg"####-----mayo
]


product_names = ["'You could say it's Electrifying'", "'Pika Pikachu' Deadpool T", "'Poke Ball' Pokemon Tee",####---end of wadie
"Pokemon 'Lapras' inspired fan art", "Pokemon Go inspired fan art", "Pokemon 'Catch 'em All' fan art",####---end of lee4ever
 "Zorua Pokemon Sticker", "Pokemon Pals Sticker", "Sandshrew Pokemon Sticker", "Bulbasaur Pokemon Sticker", "Psyduck Pokemon Sticker", "Leafon Pokemon Sticker", "Magikarp Shiny Pokemon Sticker", "Meowth Pokemon Sticker", "Chandelure Pokemon Sticker", "Sandshrew iPhone Case", "Pokemon pals iPhone Case", "Pokemon cute iPhone Case", "Goomy Pokemon iPhone Case", "Poke Ball inspired print", "Squirtle inspired print",####---end of chibiplease
 "'Pokemon Always Stand By You'", "Charmander evolutions", "'Besties Forever' Pokemon Tee", "Nija Pokemon T-shirt", "'Kodoku' Pokemon Tee", "Charizard Pokemon Sticker", "Ash and friends Pokemon Sticker", "Pokemon Rick and Morty Case", "Pokemon Team instinct iPhone Case", "Quilava iPhone Case", "Pokemon Red print", "Pokemon Sapphire print",###----Roamingbuff
 "Pokemon Haunter iPhone case", "Pokemon Haunter Case", "Pokemon Pikachu b/w fan art", "Pokemon Psychic fan art"###---mayo
]

zip = image_names.zip(product_names)

zip.each do |img_name, product_name|
    path = Rails.root.join("app", "assets", "images", img_name)
    Product.find_by(name: product_name).uploaded_image.attach(io: File.open(path), filename: img_name)
end

















dragonballz_products = [
    {
        name: "Dragon Ball Z Shenron Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 8
    },
    {
        name: "Dragon Ball Z Goku black Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 8 
    },
    {
        name: "Goku DBZ iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 8 
    },
    {
        name: "Turtle School's kanji Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 8 
    },
    {
        name: "Goku's kanji iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 8 
    },
    {
        name: "Goku and Vegeta iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 8 
    },
    {
        name: "Goku Dragon Ball Z print",
        description: "print/wall art",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 8 
    },
    {
        name: "Fusion! Dragon Ball Z print",
        description: "print/wall art",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 8 
    },
    {
        name: "Vegeta Dragon Ball Z print",
        description: "print/wall art",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 8 
    },
    {
        name: "Dragon Ball Z Dragon Balls print",
        description: "print/wall art",
        profile_id: User.find_by(email: "roamingbuffalo@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 8 
    },####-----------------------------------------------------------------------------------------------roamingbuff
    {
        name: "'Fusion' Dragon Ball Z Tee",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 8 
    },
    {
        name: "DBZ 'FUSION' T-shirt",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 8 
    },
    {
        name: "Dragon Ball Z T-Shirt.",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 8 
    },
    {
        name: "Dragon Ball Z Stickers",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 8
    },
    {
        name: "Goku x Vegeta Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 8
    },
    {
        name: "Dragon Ball Z sticker.",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 8
    },
    {
        name: "Dragon Ball Z Goku black/white",
        description: "Durable phone case",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 8 
    },
    {
        name: "Goku D.B.Z iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 8 
    },
    {
        name: "Goku Dragon Ball Z  fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 8 
    },
    {
        name: "Dragon Ball Z 'dark' print",
        description: "print/wall art",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 8 
    },
    {
        name: "Dragon Ball Z 'dark' fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 8 
    },
    {
        name: "Dragon Ball Z Super Saiyan print",
        description: "print/wall art",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 8 
    },
    {
        name: "Dragon Ball Z 'words' print",
        description: "print/wall art",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 8 
    }####--------------------------------------------------------------------------------------------------mayo
]

dragonballz_products.each do |product|
    Product.create!(product)
end


image_names = ["DragonballZ-sticker-8.jpg", "DragonballZ-iphone-4.jpg", "DragonballZ-iphone-5.jpg", "DragonballZ-iphone-6.jpeg", "DragonballZ-iphone-8.jpg", "DragonballZ-iphone-10.jpg", "DragonballZ-prints-1.jpg", "DragonballZ-prints-2.jpg", "DragonballZ-prints-5.jpg", "DragonballZ-prints-6.jpg",####-----roaming buff
 "DragonballZ-tee-4.jpg", "DragonballZ-tee-5.jpg", "DragonballZ-tee-8.jpg", "DragonballZ-sticker-2.jpg", "DragonballZ-sticker-5.jpg", "DragonballZ-sticker-11.jpg", "DragonballZ-iphone-3.jpg", "DragonballZ-iphone-1.png", "DragonballZ-prints-8.jpg", "DragonballZ-prints-3.jpg", "DragonballZ-prints-7.jpg", "DragonballZ-prints-4.jpg", "DragonballZ-prints-9.jpg"####----mayo
]


product_names = ["Dragon Ball Z Shenron Sticker", "Dragon Ball Z Goku black Case", "Goku DBZ iPhone Case", "Turtle School's kanji Case", "Goku's kanji iPhone Case", "Goku and Vegeta iPhone Case", "Goku Dragon Ball Z print", "Fusion! Dragon Ball Z print", "Vegeta Dragon Ball Z print", "Dragon Ball Z Dragon Balls print",####-----roaming buff
"'Fusion' Dragon Ball Z Tee", "DBZ 'FUSION' T-shirt", "Dragon Ball Z T-Shirt.", "Dragon Ball Z Stickers", "Goku x Vegeta Sticker", "Dragon Ball Z sticker.", "Dragon Ball Z Goku black/white", "Goku D.B.Z iPhone Case", "Goku Dragon Ball Z  fan art", "Dragon Ball Z 'dark' print", "Dragon Ball Z 'dark' fan art", "Dragon Ball Z Super Saiyan print", "Dragon Ball Z 'words' print"####-----mayo
]

zip = image_names.zip(product_names)

zip.each do |img_name, product_name|
    path = Rails.root.join("app", "assets", "images", img_name)
    Product.find_by(name: product_name).uploaded_image.attach(io: File.open(path), filename: img_name)
end




















fullmetalalchemist_products = [
    {
        name: "'Alphonse Elric' T",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "thedefender@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 9
    },
    {
        name: "FMA 'Edward Elric' T",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "thedefender@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 9
    },
    {
        name: "FMA Edward + Alphonse B2B",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "thedefender@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 9
    },
    {
        name: "FMA Edward + Alphonse Sybol",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "thedefender@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 9
    },
    {
        name: "Edward + Alphonse Sticker'",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "thedefender@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 9
    },
    {
        name: "FMA helmet Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "thedefender@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 9
    },
    {
        name: "'Edward Elric' Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "thedefender@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 9
    },
    {
        name: "The Gate of Truth iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "thedefender@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 9
    },
    {
        name: "Edward + Alphonse iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "thedefender@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 9
    },
    {
        name: "FMA iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "thedefender@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 9
    },
    {
        name: "Fullmetal Alchemist inspired print",
        description: "print/wall art",
        profile_id: User.find_by(email: "thedefender@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 9
    },
    {
        name: "Fullmetal Alchemist fan inspired print",
        description: "print/wall art",
        profile_id: User.find_by(email: "thedefender@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 9
    },####---------------------------------------------------------------------------------------------def end
    {
        name: "Fullmetal Alchemist inspired art T",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "waffles@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 9
    },
    {
        name: "Fullmetal Alchemist T",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "waffles@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 9
    },
    {
        name: "Working on my Alchemy",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "waffles@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 9
    },
    {
        name: "It only cost an arm and a leg",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "waffles@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 9
    },
    {
        name: "FMA blood circle Sticker'",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "waffles@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 9
    },
    {
        name: "Angry Edward Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "waffles@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 9
    },
    {
        name: "Are you an Alchemist Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "waffles@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 9
    },
    {
        name: "FMA Edward + Alphonse Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "waffles@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 9
    },
    {
        name: "'WHO ARE YOU CALLING SHORT'",
        description: "Durable phone case",
        profile_id: User.find_by(email: "waffles@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 9
    },
    {
        name: "FMA The Gang iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "waffles@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 9
    },
    {
        name: "FMA Edward Fighting inspired fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "waffles@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 9
    },
    {
        name: "Fullmetal Alchemist sick fan inspired print",
        description: "print/wall art",
        profile_id: User.find_by(email: "waffles@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 9
    },
    {
        name: "Fullmetal Alchemist fan print",
        description: "print/wall art",
        profile_id: User.find_by(email: "waffles@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 9
    },
    {
        name: "Fullmetal Alchemist 'Damaged'",
        description: "print/wall art",
        profile_id: User.find_by(email: "waffles@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 9
    },
    {
        name: "Fullmetal Alchemist 'Ready to Fight'",
        description: "print/wall art",
        profile_id: User.find_by(email: "waffles@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 9
    },
    {
        name: "Fullmetal Alchemist fan Wallart",
        description: "print/wall art",
        profile_id: User.find_by(email: "waffles@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 9
    },####--------------------------------------------------------------------------------------------------waffles
    {
        name: "Fullmetal Alchemist brotherhood symbol",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "exdemon@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 9
    },
    {
        name: "Roy's transmutation circle",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "exdemon@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 9
    },
    {
        name: "Transmutation circle Alphonse",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "exdemon@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 9
    },
    {
        name: "Fullmetal Alchemist b/r Sticker'",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "exdemon@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 9
    },
    {
        name: "Homunculus Symbol Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "exdemon@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 9
    },
    {
        name: "Roy FMA Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "exdemon@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 9
    },
    {
        name: "Brotherhood iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "exdemon@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 9
    },
    {
        name: "Edward + Alphonse b2b iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "exdemon@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 9
    },
    {
        name: "Fullmetal Alchemist Roy fan print",
        description: "print/wall art",
        profile_id: User.find_by(email: "exdemon@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 9
    },
    {
        name: "FMA Brotherhood Symbol fan Print",
        description: "print/wall art",
        profile_id: User.find_by(email: "exdemon@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 9
    },
    {
        name: "Fullmetal Alchemist 'Ready'",
        description: "print/wall art",
        profile_id: User.find_by(email: "exdemon@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 9
    },
    {
        name: "Fullmetal Alchemist beauty fan Print",
        description: "print/wall art",
        profile_id: User.find_by(email: "exdemon@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 9
    },####----------------------------------------------------------------------------------------------------exdemon
    {
        name: "FMA Brotherhood Symbol Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 9
    },
    {
        name: "FMA Brotherhood, Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 9
    },
    {
        name: "Homunculus FMA iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 9
    },
    {
        name: "FMA Roy, iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "mysticmayo@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 9
    }

]

fullmetalalchemist_products.each do |product|
    Product.create!(product)
end


image_names = ["FullmetalAlchemist-tees-7.jpg", "FullmetalAlchemist-tees-8.jpg", "FullmetalAlchemist-tees-1.jpg", "FullmetalAlchemist-tees-5.jpg", "FullmetalAlchemist-stickers-2.jpg", "FullmetalAlchemist-stickers-4.jpg", "FullmetalAlchemist-stickers-5.jpg", "FMA-iphonecase-1.jpg", "FMA-iphonecase-3.jpg", "FMA-iphonecase-7.jpg", "FullmetalAlchemist-prints-4.jpg", "FullmetalAlchemist-prints-6.png",####-----def end
 "FullmetalAlchemist-tees-6.jpg", "FullmetalAlchemist-tees-9.jpg", "FullmetalAlchemist-tees-10.jpeg", "FullmetalAlchemist-tees-11.png", "FullmetalAlchemist-stickers-6.jpg", "FullmetalAlchemist-stickers-7.jpg", "FullmetalAlchemist-stickers-12.jpg", "FMA-iphonecase-5.jpg", "FMA-iphonecase-6.jpg", "FMA-iphonecase-10.jpg", "FullmetalAlchemist-prints-7.jpg", "FullmetalAlchemist-prints-10.jpg", "FullmetalAlchemist-prints-11.jpg", "FullmetalAlchemist-prints-12.jpg", "FullmetalAlchemist-prints-1.jpg", "FullmetalAlchemist-prints-3.jpg",####----waffel end
 "FullmetalAlchemist-tees-3.jpg", "FullmetalAlchemist-tees-12.jpg", "FullmetalAlchemist-tees-2.jpg", "FullmetalAlchemist-stickers-3.jpg", "FullmetalAlchemist-stickers-9.jpg", "FullmetalAlchemist-stickers-10.jpg", "FMA-iphonecase-2.jpg", "FMA-iphonecase-4.jpg", "FullmetalAlchemist-prints-9.jpg", "FullmetalAlchemist-prints-2.jpg", "FullmetalAlchemist-prints-8.jpg", "FullmetalAlchemist-prints-5.jpg",####----exdemon
 "FullmetalAlchemist-stickers-11.jpg", "FullmetalAlchemist-stickers-8.jpg", "FMA-iphonecase-11.jpg", "FMA-iphonecase-12.jpg"####-----mayo
]


product_names = ["'Alphonse Elric' T", "FMA 'Edward Elric' T", "FMA Edward + Alphonse B2B", "FMA Edward + Alphonse Sybol", "Edward + Alphonse Sticker'", "FMA helmet Sticker", "'Edward Elric' Sticker", "The Gate of Truth iPhone Case", "Edward + Alphonse iPhone Case", "FMA iPhone Case", "Fullmetal Alchemist inspired print", "Fullmetal Alchemist fan inspired print",####--------def end
"Fullmetal Alchemist inspired art T", "Fullmetal Alchemist T", "Working on my Alchemy", "It only cost an arm and a leg", "FMA blood circle Sticker'", "Angry Edward Sticker", "Are you an Alchemist Sticker", "FMA Edward + Alphonse Case", "'WHO ARE YOU CALLING SHORT'", "FMA The Gang iPhone Case", "FMA Edward Fighting inspired fan art", "Fullmetal Alchemist sick fan inspired print", "Fullmetal Alchemist fan print", "Fullmetal Alchemist 'Damaged'", "Fullmetal Alchemist 'Ready to Fight'", "Fullmetal Alchemist fan Wallart",####-----waffles
 "Fullmetal Alchemist brotherhood symbol", "Roy's transmutation circle", "Transmutation circle Alphonse", "Fullmetal Alchemist b/r Sticker'", "Homunculus Symbol Sticker", "Roy FMA Sticker", "Brotherhood iPhone Case", "Edward + Alphonse b2b iPhone Case", "Fullmetal Alchemist Roy fan print", "FMA Brotherhood Symbol fan Print", "Fullmetal Alchemist 'Ready'", "Fullmetal Alchemist beauty fan Print",####----exdemon
 "FMA Brotherhood Symbol Sticker", "FMA Brotherhood, Sticker", "Homunculus FMA iPhone Case", "FMA Roy, iPhone Case"####----mayo
]

zip = image_names.zip(product_names)

zip.each do |img_name, product_name|
    path = Rails.root.join("app", "assets", "images", img_name)
    Product.find_by(name: product_name).uploaded_image.attach(io: File.open(path), filename: img_name)
end

















sherlock_products = [
    {
        name: "Sherlock Quotes T",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 10 
    },
    {
        name: "Sherlock Comic Styled T",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "oldschool@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 10 
    },####-------------------------------------------------------------------------------------------end of oldschool
    {
        name: "Sherlock fan inspired T",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 10 
    },
    {
        name: "Sherlock and Watsonfan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 10 
    },####------------------------------------------------------------------------------------------end of chibiplease
    {
        name: "'Moriarty Our King' T",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "madie@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 10 
    },
    {
        name: "Moriarty 'The Game is On'",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "madie@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 10 
    },
    {
        name: "Moriarty 'Miss Me?'",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "madie@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 10 
    },
    {
        name: "Moriarty 'Miss Me?' Tag",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "madie@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 10 
    },
    {
        name: "Sherlock 'SWAG' iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "madie@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 10 
    },####-----------------------------------------------------------------------------------------------end of madie
    {
        name: "'I belive in Sherlock Holmes'",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "mycroft@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 10 
    },
    {
        name: "Sherlock 'look, I have a blanket'",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "mycroft@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 10 
    },
    {
        name: "'The game is never over' Sherlock",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "mycroft@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 10 
    },
    {
        name: "'I am Sher Locked' sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "mycroft@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 10 
    },
    {
        name: "'I am Not a Psychopath' Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "mycroft@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 10 
    },
    {
        name: "'Keep Calm and text Sherlock' Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "mycroft@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 10 
    },
    {
        name: "'Not now Watson' iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "mycroft@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 10 
    },
    {
        name: "'Van Sherlock' iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "mycroft@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 10 
    },
    {
        name: "'I am Not a Psychopath' iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "mycroft@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 10 
    },
    {
        name: "Sherlock profile fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "mycroft@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 10 
    },
    {
        name: "Sherlock and Violin fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "mycroft@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 10 
    },
    {
        name: "Sherlock 'Gray' fan art",
        description: "print/wall art",
        profile_id: User.find_by(email: "mycroft@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 10 
    },
    {
        name: "'There's an East Wind coming' art",
        description: "print/wall art",
        profile_id: User.find_by(email: "mycroft@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 10 
    },
    {
        name: "Sherlock fan wall art",
        description: "print/wall art",
        profile_id: User.find_by(email: "mycroft@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 10 
    }####-----------------------------------------------------------------------------------------------mycroft
]



sherlock_products.each do |product|
    Product.create!(product)
end


image_names = ["sherlock-tee-7.jpg", "sherlock-tee-12.jpg",####----end of oldschool
 "sherlock-tee-11.jpeg", "sherlock-print-5.jpg",####----end of chibiplease
 "sherlock-tee-9.jpg", "sherlock-sticker-6.jpg", "sherlock-sticker-10.jpg", "sherlock-sticker-2.jpg", "sherlock-iphonecase-5.jpg",####----end of madie
 "sherlock-tee-1.jpg", "sherlock-tee-5.jpg", "sherlock-tee-8.jpg", "sherlock-sticker-1.jpg", "sherlock-sticker-4.png", "sherlock-sticker-8.jpg", "sherlock-iphonecase-6.jpg", "sherlock-iphonecase-7.jpg", "sherlock-iphonecase-8.jpg", "sherlock-print-1.jpg", "sherlock-print-4.jpg", "sherlock-print-6.jpg", "sherlock-print-8.jpg", "sherlock-print-9.jpg"####----mycroft
]


product_names = ["Sherlock Quotes T", "Sherlock Comic Styled T",####----end of oldschool
"Sherlock fan inspired T", "Sherlock and Watsonfan art",####----end of chibiplease
"'Moriarty Our King' T", "Moriarty 'The Game is On'", "Moriarty 'Miss Me?'", "Moriarty 'Miss Me?' Tag", "Sherlock 'SWAG' iPhone Case",####----end of madie
"'I belive in Sherlock Holmes'", "Sherlock 'look, I have a blanket'", "'The game is never over' Sherlock", "'I am Sher Locked' sticker", "'I am Not a Psychopath' Sticker", "'Keep Calm and text Sherlock' Sticker", "'Not now Watson' iPhone Case", "'Van Sherlock' iPhone Case", "'I am Not a Psychopath' iPhone Case", "Sherlock profile fan art", "Sherlock and Violin fan art", "Sherlock 'Gray' fan art", "'There's an East Wind coming' art", "Sherlock fan wall art"####----mycroft
]

zip = image_names.zip(product_names)

zip.each do |img_name, product_name|
    path = Rails.root.join("app", "assets", "images", img_name)
    Product.find_by(name: product_name).uploaded_image.attach(io: File.open(path), filename: img_name)
end
















adventuretime_products = [
    {
        name: "T.V Adventure Time Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 11
    },
    {
        name: "'Acceptable' Lemongrab Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 11
    },
        {
        name: "Marceline Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 11
    },####---------------------------------------------------------------------------------------end of chibiplease
    {
        name: "Adventure Time 'Player Select'",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "jake+cake@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 11 
    },
    {
        name: "Adventure Time 'What Time is it?'",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "jake+cake@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 11 
    },
    {
        name: "Adventure Time'Lets play Video Games",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "jake+cake@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 11 
    },
    {
        name: "Adventure Time 'Bacon Pancakes!!'",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "jake+cake@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 11 
    },
    {
        name: "Adventure Time 'Alice in Wonderland'",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "jake+cake@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 11 
    },
    {
        name: "'Floating Marceline' sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "jake+cake@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 11 
    },
    {
        name: "'James Backster' sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "jake+cake@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 11 
    },
    {
        name: "Adventure Time 'to battle'",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "jake+cake@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 11 
    },
    {
        name: "'Lumpy Space princesses' Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "jake+cake@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 11 
    },
    {
        name: "'Jake in a Pocket' iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "jake+cake@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 11 
    },
    {
        name: "'Jake' Adventure Time iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "jake+cake@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 11 
    },
    {
        name: "'Fin' Adventure Time iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "jake+cake@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 11 
    },
    {
        name: "Adventure Time 'hot air balloon' Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "jake+cake@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 11 
    },
    {
        name: "'Coffee Time' iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "jake+cake@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 11 
    },
    {
        name: "Fionna and Cake Poster",
        description: "print/wall art",
        profile_id: User.find_by(email: "jake+cake@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 11 
    },
    {
        name: "Adventure Time 'all girls' Poster",
        description: "print/wall art",
        profile_id: User.find_by(email: "jake+cake@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 11 
    }####-------------------------------------------------------------------------------------------------jack+cake

]

adventuretime_products.each do |product|
    Product.create!(product)
end


image_names = ["adventuretime-stickers-8.png", "adventuretime-stickers-9.jpg", "adventuretime-stickers-10.jpg",####----end of chibiplease
 "adventuretime-tee-5.jpg", "adventuretime-tee-8.jpg", "adventuretime-tee-12.jpg", "adventuretime-tee-1.jpg", "adventuretime-stickers-2.jpg", "adventuretime-stickers-5.jpg", "adventuretime-stickers-6.jpg", "adventuretime-stickers-7.jpg", "adventuretime-stickers-1.jpg", "adventuretime-iphonecase-2.jpg", "adventuretime-iphonecase-6.jpg", "adventuretime-iphonecase-8.png", "adventuretime-iphonecase-10.jpg", "adventuretime-iphonecase-11.jpg", "adventuretime-print-2.jpg", "adventuretime-print-12.jpg"####----jake+cake
]


product_names = ["T.V Adventure Time Sticker", "'Acceptable' Lemongrab Sticker", "Marceline Sticker",####----end of chibiplease
"Adventure Time 'Player Select'", "Adventure Time 'What Time is it?'", "Adventure Time'Lets play Video Games", "Adventure Time 'Bacon Pancakes!!'", "Adventure Time 'Alice in Wonderland'", "'Floating Marceline' sticker", "'James Backster' sticker", "Adventure Time 'to battle'", "'Lumpy Space princesses' Sticker", "'Jake in a Pocket' iPhone Case", "'Jake' Adventure Time iPhone Case", "'Fin' Adventure Time iPhone Case", "Adventure Time 'hot air balloon' Case", "'Coffee Time' iPhone Case", "Fionna and Cake Poster", "Adventure Time 'all girls' Poster"####----jake+cake
]

zip = image_names.zip(product_names)

zip.each do |img_name, product_name|
    path = Rails.root.join("app", "assets", "images", img_name)
    Product.find_by(name: product_name).uploaded_image.attach(io: File.open(path), filename: img_name)
end

















gameofthrones_products = [
    {
        name: "King of the North",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 12 
    },
    {
        name: "Winter is Coming iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 12 
    },
    {
        name: "'I'm still Alive' iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 12 
    },
    {
        name: "GOT 7 kingdoms inspired print",
        description: "print/wall art",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 12 
    },
    {
        name: "GOT inspired fan print",
        description: "print/wall art",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 12 
    },
    {
        name: "GOT 'you hear them, boy?' inspired print",
        description: "print/wall art",
        profile_id: User.find_by(email: "chibiplease@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 12 
    },####-----------------------------------------------------------------------------------------end of chibiplease
    {
        name: "I am the watcher GOT",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "raven@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 12 
    },
    {
        name: "GOT and Rick and Morty cross",
        description: "100% cotton, casual tee",
        profile_id: User.find_by(email: "raven@gmail.com").profile.id,     ###----------T-Shirt
        category_id: 1,
        fandom_id: 12 
    },
    {
        name: "Winter is coming, GOT Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "raven@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 12
    },
    {
        name: "Crows before Hoes, GOT Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "raven@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 12
    },
    {
        name: "Mother of Dogs, GOT Sticker",
        description: "sticker for stuff to look pretty/different",
        profile_id: User.find_by(email: "raven@gmail.com").profile.id,     ###----------Sticker
        category_id: 2,
        fandom_id: 12
    },
    {
        name: "Five Kings One Throne iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "raven@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 12 
    },
    {
        name: "Game of Thrones, iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "raven@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 12 
    },
    {
        name: "Game of Thrones b/w iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "raven@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 12 
    },
    {
        name: "'Winter is here' iPhone Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "raven@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 12 
    },
    {
        name: "'Game of Thrones' Throne Case",
        description: "Durable phone case",
        profile_id: User.find_by(email: "raven@gmail.com").profile.id,     ###----------iPhone-Case
        category_id: 3,
        fandom_id: 12 
    },
    {
        name: "GOT Jon Snow inspired fan print",
        description: "print/wall art",
        profile_id: User.find_by(email: "raven@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 12 
    },
    {
        name: "'A song of Ice and Fire' print",
        description: "print/wall art",
        profile_id: User.find_by(email: "raven@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 12 
    },
    {
        name: "Game of Thrones inspired Fan Art Print",
        description: "print/wall art",
        profile_id: User.find_by(email: "raven@gmail.com").profile.id,     ###----------Print
        category_id: 4,
        fandom_id: 12 
    }####-----------------------------------------------------------------------------------------------------raven
]
gameofthrones_products.each do |product|
    Product.create!(product)
end


image_names = ["GOT-tee-4.jpg", "GOT-iphone-1.jpg", "GOT-iphone-11.jpg", "GOT-print-1.jpg", "GOT-print-3.jpg", "GOT-print-11.jpg",####----end of chibiplease
 "GOT-tee-3.jpg", "GOT-tee-6.jpg", "GOT-stickers-1.png", "GOT-stickers-4.png", "GOT-stickers-5.jpg", "GOT-iphone-5.jpg", "GOT-iphone-8.jpg", "GOT-iphone-9.jpg", "GOT-iphone-10.png", "GOT-iphone-12.jpg", "GOT-print-5.jpg", "GOT-print-6.jpg", "GOT-print-7.jpg"####-----raven
]


zes = [
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




Product.all.each do |product|
    if product.category.id == 1
        product_variants = [
            {
                product_id: product.id,         
                size_id: 1,
                stock_QTY: 20,
                price: 16
            },
            {
                product_id: product.id,         
                size_id: 2,
                stock_QTY: 20,
                price: 18
            },
            {
                product_id: product.id,
                size_id: 3,
                stock_QTY: 20,
                price: 18                           #------t-shirt sizes--------
            },
            {
                product_id: product.id,
                size_id: 4,
                stock_QTY: 20,
                price: 18
            },
            {
                product_id: product.id,         
                size_id: 5,
                stock_QTY: 20,
                price: 20
            },
            {
                product_id: product.id,         
                size_id: 6,
                stock_QTY: 20,
                price: 22
            }
        ]

        product_variants.each do |variant|
            ProductVariant.create!(variant)
        end

    elsif product.category.id == 2
        product_variants = [
            {
                product_id: product.id,
                size_id: 7,
                stock_QTY: 20,
                price: 2.5
            },
            {
                product_id: product.id,         
                size_id: 8,
                stock_QTY: 20,
                price: 6.25                            #-------------sticker sizes---------
            },
            {
                product_id: product.id,         
                size_id: 9,
                stock_QTY: 20,
                price: 12.34
            }
        ]

        product_variants.each do |variant|
            ProductVariant.create!(variant)
        end

    elsif product.category.id == 3
        product_variants = [
            {
                product_id: product.id,
                size_id: 10,
                stock_QTY: 20,
                price: 14.25
            },
            {
                product_id: product.id,         
                size_id: 11,
                stock_QTY: 20,                         #------iphone case sizes------
                price: 15.83
            },
            {
                product_id: product.id,         
                size_id: 12,
                stock_QTY: 20,
                price: 16.75
            },
            {
                product_id: product.id,         
                size_id: 13,
                stock_QTY: 20,
                price: 18.99
            }
        ]

        product_variants.each do |variant|
            ProductVariant.create!(variant)
        end

    elsif product.category.id == 4
        product_variants = [
            {
                product_id: product.id,
                size_id: 14,
                stock_QTY: 20,
                price: 32
            },
            {
                product_id: product.id,
                size_id: 15,
                stock_QTY: 20,
                price: 56                               #----------Print sizes---------
            },
            {
                product_id: product.id,         
                size_id: 16,
                stock_QTY: 20,
                price: 79
            },
            {
                product_id: product.id,         
                size_id: 17,
                stock_QTY: 20,
                price: 98
            }
        ]

        product_variants.each do |variant|
            ProductVariant.create!(variant)
        end
    end
end
