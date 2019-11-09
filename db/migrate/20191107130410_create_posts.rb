class CreatePosts < ActiveRecord::Migration[6.0]
  def change
  	create_table :posts do |t|
      t.text :content
      t.text :username

      t.timestamps
	  end

    create_table :comments do |t|
      t.belongs_to :post
      t.text :content_com
      t.integer :post_id

      t.timestamps
    end

  end
end
