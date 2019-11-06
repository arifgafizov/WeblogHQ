class CreatePosts < ActiveRecord::Migration[6.0]
  def change
  	create_table :posts do |t|
     t.date :created_date
     t.text :content
     t.text :username

     t.timestamps
	end
  end
end