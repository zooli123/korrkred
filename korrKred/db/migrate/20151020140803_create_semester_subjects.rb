class CreateSemesterSubjects < ActiveRecord::Migration
  def change
    create_table :semester_subjects do |t|
      t.integer :grade
      t.belongs_to :semester
      t.belongs_to :subject
      t.timestamps null: false
    end
  end
end
