class Semester < ActiveRecord::Base
	has_many :subject
	has_many :user_year
	has_and_belongs_to_many :user
end
