class KorrkredController < ApplicationController

	def index		
	end
	def home
	end
	def subjects
	end
	def semesters
		semesters = Semester.all
		@semesters = Array.new
		for s in semesters
			sem = Array.new
			sem.push(s.year)
			sem.push(s.half_year)
			@semesters.push(sem);
		end

	end
	def semesters_new
		
	end
end
