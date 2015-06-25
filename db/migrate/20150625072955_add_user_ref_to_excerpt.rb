class AddUserRefToExcerpt < ActiveRecord::Migration
  def change
  	add_reference :excerpts, :user, index: true
  end
end
