class KorrkredController < ApplicationController

	def index		
	end
	def home
		@current_user = current_user
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
