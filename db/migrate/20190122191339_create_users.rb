class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    #dn creates table with auto-generated id
    create_table :users do |user|
      #dn creates columns for table
      user.string :username
      user.string :password
      user.string :first_name
      user.string :last_name
      user.string :email
      user.timestamps
    end
  end
end
