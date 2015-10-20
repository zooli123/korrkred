class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.string :title
      t.integer :year
      t.integer :half_year
      t.float :credit_index
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
