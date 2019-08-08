class PagesController < ApplicationController

    
def tshirts
    @tshirts = Product.where(category_id: 1).shuffle
end

def prints
    @prints = Product.where(category_id: 4).shuffle
end

def iphonecases
    @iphonecases = Product.where(category_id: 3).shuffle
end

def stickers
    @stickers = Product.where(category_id: 2).shuffle
end

def fandoms
    @fandoms = Fandom.all
end


end
