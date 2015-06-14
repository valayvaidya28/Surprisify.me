class Excerpt < ActiveRecord::Base
	has_and_belongs_to_many :categories, :joint_table => :categories_excerpts
end
