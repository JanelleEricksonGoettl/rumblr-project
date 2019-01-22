class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    #dn creates posts table
    create_table :posts do |post|
      post.string :title
      post.integer :user_id
      post.text :content
      post.timestamps
    end
  end
end
