class UsersController < ApplicationController
	before_filter :authenticate_user!
	def dashboard
		if !current_user.nil?
			@excerpts = current_user.excerpts
		else
			redirect_to '/users/new'
		end
	end
end
