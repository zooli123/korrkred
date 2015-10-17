class CreateUserYears < ActiveRecord::Migration
  def change
    create_table :user_years do |t|
      t.float :credit_index
      t.belongs_to :semester
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
