class UsersController < ApplicationController
	before_filter :authenticate_user!
	def dashboard
		if !current_user.nil?
			if(current_user.email == "valayvaidya28@gmail.com")
				@excerpts_to_be_approved = Excerpt.where('reviewed'=>false)
				@excerpts = Excerpt.all
				@excerpts_that_belong_to_the_user = current_user.excerpts
			else
				@excerpts = current_user.excerpts
			end
		else
			redirect_to '/users/new'
		end
	end
end
