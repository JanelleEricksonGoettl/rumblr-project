class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    #dn creates posts table
    create_table :posts do |t|
      t.string :title
      t.integer :user_id
      t.text :content
      t.datetime :datetime
    end
  end
end
