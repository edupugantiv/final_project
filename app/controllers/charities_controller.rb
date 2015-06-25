class CharitiesController < ApplicationController
	def index
		@charities = Charity.all 
	end
	def show
		@charity = Charity.find(params[:id])
	end
	def new
		@charity = Charity.new
	end

	def donate
		@charity = Charity.find(current_user.next_donation)
		@amount = (current_user.monthly_payment * 100).round

		customer = Stripe::Customer.create(
			:email => 'example@stripe.com',
			:card => params[:stripeToken]
		)

		charge = Stripe::Charge.create(
			:customer => customer.id,
			:amount => @amount,
			:description => "Donated to #{@charity.name}",
			:currency => 'usd'
		)
		Donation.create(user_id: current_user.id , charity_id: @charity.id, amount: (@amount / 100) )
		redirect_to user_path(:id => current_user.id, :worked => true)
		rescue Stripe::CardError => e
    		flash[:error] = e.message
    		redirect_to root_path
    end
end