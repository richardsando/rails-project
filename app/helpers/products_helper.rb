module ProductsHelper

    def tshirt(product)
        if product.category.category == "T-shirts"
            return true
        end
    end

    def price(product_size, product)
        # if product.product_variants.empty?
        #     return nil
        # end
        if product_size.nil? 
            return product.product_variants.order(:size_id).first.price
        else
            return product.product_variants.find_by(size_id: product_size).price
        end
    end

    def set_product_size(product_size, product)
        # if product.product_variants.empty?
        #     return nil
        # end
        if product_size.nil?
            return product.product_variants.order(:size_id).first.size_id
        else
            return product_size.to_i
        end
    end

    def artists_product
    end

    def possible_sizes(product)
        possible_sizes = []
        product.product_variants.each do |variant|
            possible_sizes << variant.size_id
        end
        return possible_sizes
    end

    def owning_artist(product)
        return current_user.profile == product.profile
    end

end
