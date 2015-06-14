class CreateCategoriesExcerpts < ActiveRecord::Migration
  def change
    create_table :categories_excerpts do |t|
    	t.belongs_to :excerpt
    	t.belongs_to :category
    end
  end
end
