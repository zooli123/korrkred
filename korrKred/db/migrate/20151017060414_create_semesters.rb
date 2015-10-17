class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.integer :year
      t.integer :half_year

      t.timestamps null: false
    end
  end
end
