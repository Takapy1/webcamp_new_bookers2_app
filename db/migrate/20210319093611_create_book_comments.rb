class CreateBookComments < ActiveRecord::Migration[5.2]
  def change
    create_table :book_comments do |t|
      t.integer :user_id
      t.integer :book_id
      t.text :comment

      t.timestamps
      
      t.index :user_id
      t.index :book_id
      
    end
  end
end
