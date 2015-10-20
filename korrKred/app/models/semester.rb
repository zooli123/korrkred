class Semester < ActiveRecord::Base
  validates :year, presence: true
  validates :half_year, presence: true
	has_and_belongs_to_many :subject
	belongs_to :user
end
