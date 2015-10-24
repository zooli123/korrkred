class Semester < ActiveRecord::Base
  validates :title, presence: true
  validates :year, presence: true
  validates :half_year, presence: true
  validates :user_id, presence: true
	has_and_belongs_to_many :subject
	belongs_to :user
end
