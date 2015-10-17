class KorrkredController < ApplicationController

	def index		
	end
	def home
	end
	def subjects
	end
	def semesters
		@semesters = Semester.all
		gon.semesters = @semesters

	end
	def semesters_new
		
	end
end
