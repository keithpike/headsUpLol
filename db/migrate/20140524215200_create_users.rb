class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.string :session_token
      t.string :password_digest
      t.timestamps
    end
    add_index :users, :email
    add_index :users, :username
  end
end
