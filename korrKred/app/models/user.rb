class User < ActiveRecord::Base
	has_many :user_year
	has_many :subject
	has_and_belongs_to_many :semester
end
