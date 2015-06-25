class PreferencesController < ApplicationController
	def destroy
		Preference.find(params[:id]).destroy
		update_results
		check_charity
		redirect_to "/users/#{current_user.id}"
	end
	def show
	end
	def create
		@preference = Preference.new(:user_id => params[:user_id], :category_id => params[:category_id])
		if @preference.save
			update_results
			check_charity
			redirect_to categories_path(:worked => true, :tried => true)
		else
			flash[:notice] = "You already have this preference."
			redirect_to categories_path(:worked => false, :tried => true, :cat_title => Category.find(@preference.category_id).title)
		end
	end

	protected

	def update_results
			Result.where("user_id = #{current_user.id}").each do |result|
				result.destroy
			end
			results = {}
			if(current_user.categories == [])
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
			if(ordered_results == [])
				return false
			end
			reversed = ordered_results.reverse
			resulting_charities = reversed.map do |pair|
				pair[0]
			end
			resulting_charities.each do |charity|
				r = Result.new
				r.user_id = current_user.id
				r.charity_id = charity.id
				r.save
			end
	end

	def check_charity
		if ((user_signed_in?) && (current_user.next_donation == nil) && (current_user.results != []))
			current_user.next_donation = current_user.results.first.charity_id
			current_user.save
		end
	end

end