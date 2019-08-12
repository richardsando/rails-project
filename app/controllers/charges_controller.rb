class ChargesController < ApplicationController
    def new
      
    end
    
    def become_artist   
      @amount = 2999  #this amount is set by the site and is constant
    
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'aud',
      })

      current_user.update_attribute(:role_id, 2)  #update the user to an artist since they paid for the subscription
    
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path

    end

    def checkout_cart
      # Amount in cents

      @amount = params[:cart_amount]
      @float_amount = params[:float_amount]
    
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'aud',
      })

      @checked_out_cart = Cart.find(params[:cart_id])
      @checked_out_cart.update_attribute(:active_status, false)   #make the old cart inactive
      @checked_out_cart.update_attribute(:total, @float_amount)
      Cart.create(profile_id: current_user.profile.id)  #and then give a new cart to that profile
      
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
  end


end
