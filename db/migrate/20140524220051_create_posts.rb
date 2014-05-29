class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :blog_id
      t.string :title
      t.string :media_url
      t.string :description
      t.string :post_type
      t.timestamps
    end
  end
end
