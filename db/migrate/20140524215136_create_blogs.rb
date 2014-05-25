class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.integer :owner_id, null: false
      t.string :title, default: 'Blog Title Here'
      t.string :url
      t.string :description
      t.string :avatar_url
      t.boolean :primary, default: false
      t.timestamps
    end
    add_index :blogs, :owner_id
  end
end
