class Category < ActiveRecord::Base
	has_and_belongs_to_many :excerpts, :joint_table => :categories_excerpts
end
