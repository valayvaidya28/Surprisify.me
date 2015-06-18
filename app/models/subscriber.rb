class Subscriber < ActiveRecord::Base
	def self.everyday_newsletter
		@subscribers = Subscriber.all
		@subscribers.each do |s|
			SubscriberMailer.everyday_newsletter(s.email).deliver
		end
	end
end
