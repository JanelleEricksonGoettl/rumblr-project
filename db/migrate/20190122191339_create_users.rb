class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    #dn creates table with auto-generated id
    create_table :users do |t|
      #dn creates columns for table
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.
    end
  end
end
