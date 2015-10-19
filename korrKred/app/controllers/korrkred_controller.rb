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
		@semesters = Semester.order(:year).order(:half_year)
		gon.semesters = @semesters
	end

	def semesters_new
		@current_user = current_user
		saved_semester_count = 0

		if(params[:semester] && params[:semester][:year] && params[:semester][:half_year])
			semester_years = params[:semester][:year]
			semester_half_years = params[:semester][:half_year]
			if semester_years != [""] && semester_half_years != [""]
				for i in 0..semester_years.size - 1 do
					# nem üres a year mező, és a megadott határok között mozog
					if (semester_years[i] != "" && semester_half_years[i] != "") && 
						(semester_years[i].to_i >= Time.now.year - 1 && semester_years[i].to_i <= Time.now.year + 2)

						semester = Semester.where("year= :year and half_year= :half_year",
							{year: "#{semester_years[i]}", half_year: "#{semester_half_years[i]}"})
						if semester.empty?
							s = Semester.new
							s.year = semester_years[i]
							s.half_year = semester_half_years[i]
							s.save
							saved_semester_count += 1
							puts "count: " + saved_semester_count.to_s
						end
					end
				end
			end
		end
		if saved_semester_count == 0
			respond_to do |format|
				flash[:notice] = t(:notice_no_semesters_saved)
				format.html { redirect_to semesters_path }
			end
		elsif saved_semester_count == 1
			respond_to do |format|
				flash[:success] = t(:success_semester_saved)
				format.html { redirect_to semesters_path }
			end
		elsif saved_semester_count > 1
			respond_to do |format|
				flash[:success] = t(:success_semesters_saved)
				format.html { redirect_to semesters_path }
			end
		end
	end
end
