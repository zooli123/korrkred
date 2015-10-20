class User < ActiveRecord::Base
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :password, presence: true
	validates :login, presence: true
	has_many :subject
  has_many :semester
end
