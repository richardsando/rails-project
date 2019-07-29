class PagesController < ApplicationController

    
def tshirts
    @tshirts = Product.where(category_id: 1)
end

def prints
    @prints = Product.where(category_id: 4)
end

def iphonecases
    @iphonecases = Product.where(category_id: 3)
end

def stickers
    @stickers = Product.where(category_id: 2)
end

def fandoms
    @fandoms = Fandom.all
end


end
