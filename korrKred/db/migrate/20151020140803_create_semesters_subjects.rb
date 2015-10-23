class CreateSemestersSubjects < ActiveRecord::Migration
  def change
    create_table :semesters_subjects do |t|
      t.integer :grade
      t.belongs_to :semester
      t.belongs_to :subject
      t.timestamps null: false
    end
    add_index :semesters_subjects, [:semester_id, :subject_id]
  end
end
