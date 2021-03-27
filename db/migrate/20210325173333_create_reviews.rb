class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :username
      t.integer :user_id
      t.string :title
      t.string :content
      t.string :date
      t.integer :book_id
      
      t.timestamps
    end
  end
end
