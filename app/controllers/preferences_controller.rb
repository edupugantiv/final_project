class PreferencesController < ApplicationController
	def destroy
		Preference.find(params[:id]).destroy
		update_results
		redirect_to "/users/#{current_user.id}"
	end
	def show
	end
	def create
		@preference = Preference.new(:user_id => params[:user_id], :category_id => params[:category_id])
		if @preference.save
			update_results
			redirect_to(:back)
			flash[:notice] = "You have added #{Category.find(@preference.category_id).title} to your preferences."
		else
			flash[:notice] = "You already have this preference."
			redirect_to(:back)
		end
	end

	protected

	def update_results
			Result.where("user_id = #{current_user.id}").each do |result|
				result.destroy
			end
			results = {}
			if(current_user.categories == nil)
				return false
			end
			current_user.categories.each do |user_category|
				user_category.charities.each do |charity|
					i = 0
					charity.categories.each do |category|
						current_user.categories.each do |preference|
							if category == preference
								i += 1
							end
						end
					end
					results[charity] = i
				end
			end
			ordered_results = results.sort_by { |charity, value| value}
	end
end