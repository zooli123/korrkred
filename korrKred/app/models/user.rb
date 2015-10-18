class User < ActiveRecord::Base
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :password, presence: true
	validates :login, presence: true
	has_many :user_year
	has_many :subject
	has_and_belongs_to_many :semester
end
