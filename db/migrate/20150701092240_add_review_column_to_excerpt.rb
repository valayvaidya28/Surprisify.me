class AddReviewColumnToExcerpt < ActiveRecord::Migration
  def change
    add_column :excerpts, :reviewed, :boolean 
  end
end
