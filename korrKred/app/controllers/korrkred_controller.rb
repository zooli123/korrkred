class KorrkredController < ApplicationController

	def index		
	end
	def home
		user = current_user
		@name_english = user.firstname + " " + user.lastname
		@name_hungarian = user.lastname + " " + user.firstname
	end
	def subjects
		@current_user = current_user
	end
	def semesters
		@current_user = current_user
		@semesters = Semester.all
		gon.semesters = @semesters

	end
	def semesters_new
		@current_user = current_user
		
	end
end
