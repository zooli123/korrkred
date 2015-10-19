class Semester < ActiveRecord::Base
  validates :year, presence: true
  validates :half_year, presence: true
	has_many :subject
	has_many :user_year
	has_and_belongs_to_many :user
end
