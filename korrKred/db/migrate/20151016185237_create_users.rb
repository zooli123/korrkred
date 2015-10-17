class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :firstname
      t.string :lastname

      t.timestamps null: false
    end
  end
end
