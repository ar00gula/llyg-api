class CreateUmbrellaTags < ActiveRecord::Migration[6.1]
  def change
    create_table :umbrella_tags do |t|
      t.string :tag_name
    
      t.timestamps
    end
  end
end
