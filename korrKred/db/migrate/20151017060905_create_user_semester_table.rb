class CreateUserSemesterTable < ActiveRecord::Migration
  def change
    create_table :user_semester_tables do |t|
    	t.belongs_to :user
    	t.belongs_to :semester
    end
  end
end
