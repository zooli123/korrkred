class KorrkredController < ApplicationController
  before_action :require_login

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
		@semesters = current_user.semester.order(:year).order(:half_year)
		gon.semesters = @semesters
	end

	def semesters_new
		@current_user = current_user
		saved_semester = false
		error_existing_title = false

		if(params[:semester] && params[:semester][:year] && params[:semester][:half_year])
			semester_year = params[:semester][:year]
			semester_half_year = params[:semester][:half_year]
			semester_title = params[:semester][:title]
			year = Time.now.year
			year_min = year - 1
			year_max = year + 2

			if semester_year != "" && semester_half_year != "" && semester_year.to_i >= year_min &&
				semester_year.to_i <= year_max && [1,2].include?(semester_half_year.to_i)

				generated_title = semester_title == "" ? semester_year.to_s + "/" + semester_half_year.to_s : nil

				semester = Semester.where("user_id= :user_id and title= :title and year= :year or
																	 user_id= :user_id and title= :generated_title and year= :year",
								                  {title: "#{semester_title}",
								                  generated_title: "#{generated_title}",
								                  user_id: "#{@current_user.id}",
								                  year: "#{semester_year}"})
				if semester.empty?
					s = Semester.new
					s.title = semester_title != "" ? semester_title : semester_year.to_s + "/" + semester_half_year.to_s
					s.year = semester_year
					s.half_year = semester_half_year
					s.user_id = @current_user.id
					s.save
					saved_semester = true
				else
					error_existing_title = true
				end
			end
		end

		if saved_semester
			respond_to do |format|
				flash[:success] = t(:success_semester_saved)
				format.html { redirect_to semesters_path }
			end
		elsif !saved_semester && !error_existing_title
			respond_to do |format|
				flash[:notice] = t(:notice_no_semesters_saved)
				format.html { redirect_to semesters_path }
			end
		elsif !saved_semester && error_existing_title
			respond_to do |format|
				flash[:notice] = t(:notice_no_save_existing_title)
				format.html { redirect_to semesters_path }
			end
		end
	end

  def require_login
    unless logged_in?
      flash[:error] = t(:error_not_logged_in)
      redirect_to root_path
    end
  end
end
