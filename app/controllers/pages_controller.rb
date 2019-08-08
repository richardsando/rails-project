class PagesController < ApplicationController

    def show
        @products = Product.all
        @category = Category.find(params[:id])

    end
    
    def fandoms
        @products = Product.all
        @fandoms = Fandom.all
    end

end
