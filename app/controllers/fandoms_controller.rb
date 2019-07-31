class FandomsController < ApplicationController

    def marvel
        @products = Product.where(fandom_id: 1)
    end

    def dc
        @products = Product.where(fandom_id: 2)
    end
    
    def star_wars
        @products = Product.where(fandom_id: 3)
    end
    
    def dr_who
        @products = Product.where(fandom_id: 4)
    end
    
    def the_walking_dead
        @products = Product.where(fandom_id: 5)
    end
    
    def supernatural
        @products = Product.where(fandom_id: 6)
    end
    
    def pokemon
        @products = Product.where(fandom_id: 7)
    end
    
    def dragonball_z
        @products = Product.where(fandom_id: 8)
    end
    
    def fullmetal_alchemist
        @products = Product.where(fandom_id: 9)
    end

    def sherlock
        @products = Product.where(fandom_id: 10)
    end

    def adventure_time
        @products = Product.where(fandom_id: 11)
    end

    def game_of_thrones
        @products = Product.where(fandom_id: 12)
    end
end