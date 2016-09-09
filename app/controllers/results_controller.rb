class ResultsController < ApplicationController
	def destroy
		Result.find(params[:id]).destroy
		redirect_to (:back)
	end

	def create
		@result = Result.new(:user_id => params[:user_id], :charity_id => params[:charity_id])
		@result.save
		redirect_to(:back)
	end
end