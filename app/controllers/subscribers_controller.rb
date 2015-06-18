class SubscribersController < ApplicationController
	def new
		@subscriber = Subscriber.new
	end

	def create
		@subscriber = Subscriber.new(:email => params[:email])
		if @subscriber.save
			flash[:success] = "Get ready to sneak a peek!"
			redirect_to excerpts_path
		end
	end
end
