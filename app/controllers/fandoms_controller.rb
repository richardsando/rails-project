class FandomsController < ApplicationController


    def fandom
        @products = Product.all
        @fandom = Fandom.find(params[:id])

        # raise
    end

end