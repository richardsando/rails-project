module CartsHelper

    def cart_total(cart_id)
        cart = Cart.find(cart_id)   #get the cart that the products belong to 
        total = 0.0
        cart.products_purchaseds.each do |purchased_product|
            total += purchased_product.purchase_QTY * ProductVariant.find(purchased_product.product_variant_id).price
        end
        return total
    end
    
end
