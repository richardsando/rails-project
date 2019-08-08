module ProductsHelper

    def tshirt(product)
        if product.category.category == "T-shirts"
            return true
        end
    end


end
