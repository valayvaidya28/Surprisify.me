class CreateExcerpts < ActiveRecord::Migration
  def change
    create_table :excerpts do |t|
    	t.string :content, null: false
    	t.string :author_name, null: false, default: ""
    	t.string :book_name, null: false, default: ""
      t.timestamps null: false
    end
  end
end
