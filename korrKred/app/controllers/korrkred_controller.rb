class KorrkredController < ApplicationController
  before_action :require_login

	def index		
	end

	def home
		user = current_user
		@name_english = user.firstname + " " + user.lastname
		@name_hungarian = user.lastname + " " + user.firstname
	end



#-----subjects------subjects------subjects------subjects------subjects------subjects------subjects------subjects------




	def subjects
		@current_user = current_user
		@subjects = @current_user.subject.order(:name)
	end

	def subjects_new
		@current_user = current_user
		current_subject = Subject.new(subject_params)
		puts "benne? " + (0..20).include?(current_subject.credit).to_s
		if current_subject.name != "" && current_subject.credit != "" && (0..20).include?(current_subject.credit)
			subjects = Subject.where("name= :name and user_id= :user_id",
															 {name: "#{current_subject.name}", user_id: "#{@current_user.id}"})
			if subjects.empty?
				current_subject.user_id = @current_user.id
				current_subject.save
				respond_to do |format|
					flash[:success] = t(:success_subject_saved)
					format.html { redirect_to subjects_path }
				end
			else
				respond_to do |format|
					flash[:notice] = t(:notice_subject_exists)
					format.html { redirect_to subjects_path }
				end
			end
		else
			respond_to do |format|
				flash[:notice] = t(:notice_no_subject_saved)
				format.html { redirect_to subjects_path }
			end
		end
	end

	def change_subject
		actual_subject = Subject.find(params[:subject_id])

		if params[:delete_subject]
			actual_subject.destroy
		elsif params[:change_credit]
			actual_subject.update(credit: params[:credit])
		end

		respond_to do |format|
			format.html { redirect_to subjects_path }
		end
	end



#-----semesters------semesters------semesters------semesters------semesters------semesters------semesters------semesters------




	def semesters
		@current_user = current_user
		@semesters = @current_user.semester.order(:year).order(:half_year)
		# gon.semesters = @semesters
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

	def semesters_set
		@current_user = current_user
		semester = @current_user.semester.where("id= :id",{id: "#{params[:id]}"})
		if semester.empty?
			respond_to do |format|
				flash[:notice] = t(:notice_no_semester_found)
				format.html {redirect_to semesters_path}
			end
		else
			semester = semester[0]
			@semester_title = semester.title
			@semester_id = semester.id
			subjects = @current_user.subject
			@all_subjects = Hash.new
			for s in subjects
				name = s.name
				id = s.id
				@all_subjects.store(name, id)
			end

			@subjects = semester.subject
			@grade = Array.new
			for s in @subjects
				x = SemestersSubjects.where("subject_id= :subject_id and semester_id= :semester_id",
																	{subject_id: "#{s.id}", semester_id: "#{semester.id}"})
				@grade.push(x[0].grade)
			end
		end
	end


	def add_subject_to_semester
		@current_user = current_user
		if !params[:subject_id] || !params[:grade]
			respond_to do |format|
				flash[:notice] = t(:notice_no_subject_added)
				format.html {redirect_to semesters_add_subject_path}
			end
		else
			subject = params[:subject_id]
			semester = params[:id]
			grade = params[:grade]

			semester_subject = SemestersSubjects.new
			semester_subject.grade = grade
			semester_subject.semester_id = semester
			semester_subject.subject_id = subject

			existings = SemestersSubjects.where("subject_id= :subject_id and semester_id= :semester_id",
																					{subject_id: "#{subject}", semester_id: "#{semester}"})
			if existings.empty?
				semester_subject.save

				respond_to do |format|
					flash[:success] = t(:success_subject_added)
					format.html {redirect_to semesters_add_subject_path}
				end
			else
				respond_to do |format|
					flash[:notice] = t(:notice_existing_subject)
					format.html {redirect_to semesters_add_subject_path}
				end
			end
		end
	end

	def change_semester
		actual_semester = Semester.find(params[:id])
		actual_subject = Subject.find(params[:subject_id])
		grade = params[:grade]
		semester_subject = SemestersSubjects.where(:semester_id => actual_semester, :subject_id => actual_subject)[0]

		if params[:change_grade]
			semester_subject.update(grade: grade)

		elsif params[:delete_subject_from_semester]
			semester_subject.delete
		end

		respond_to do |format|
			format.html {redirect_to semesters_add_subject_path}
		end
	end



#-----index_counter------index_counter------index_counter------index_counter------index_counter------index_counter------

def count_index
	# a grades_credits jegyenként tárolja a krediteket
	grades_credits = Hash.new
	s = SemestersSubjects.where(:semester_id => params[:id])
	for element in s
		credit = Subject.where(:id => element.subject_id)[0]
		credit = credit.credit
		if grades_credits[element.grade]
			grades_credits[element.grade] += credit
		else
			grades_credits.store(element.grade, credit)
		end
	end

	grades_credits.each do |grade, credit|
		puts grade.to_s + ": " + credit.to_s
	end

	respond_to do |format|
			format.html {redirect_to semesters_add_subject_path}
		end

end





#-----private------private------private------private------private------private------private------private------private------

private
	  def subject_params
	    params.require(:subject).permit(:name, :credit)
	  end

	  def require_login
	    unless logged_in?
	      flash[:error] = t(:error_not_logged_in)
	      redirect_to root_path
	    end
	  end
end
