require 'test_helper'

class KorrkredControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "creating new subject" do
    puts __method__
    assert_difference("Subject.count", 1, "Should create subject with name 'tantargy3.'") do
      log_in @user
      post :subjects_new, :subject => { name: "tantargy3",  credit: 2}
    end

    assert_no_difference("Subject.count", "Shouldn't create subject with name 'tantargy3.'") do
      log_in @user
      post :subjects_new, :subject => { name: "tantargy3",  credit: 2}
    end

    assert_no_difference("Subject.count", "Shouldn't create subject with name 'tantargy4.'") do
      log_in @user
      post :subjects_new, :subject => { name: "tantargy4"}
    end
  end

  test "update subject" do
    puts __method__
    log_in @user
    post :change_subject, {subject_id: 1, change_credit: true, credit: 18}
    assert_response :found
    sub = Subject.find(1)
    assert_equal(18, sub.credit)
  end

  test "delete subject" do
    puts __method__
    log_in(@user)
    assert_difference("Subject.count", -1) do
      post :change_subject, {subject_id: 1, delete_subject: true}
    end
  end

  test "creating new semester" do
    puts __method__
    log_in @user
    assert_difference("Semester.count") do
      post :semesters_new, :semester => { year: 2015, half_year: 1, title: "title"}
    end

    assert_difference("Semester.count") do
      post :semesters_new, :semester => { year: 2015, half_year: 1, title: ""}
    end
  end

  test "not creating new semester" do
    puts __method__
    log_in @user
    puts "\t- without half_year"
    assert_no_difference("Semester.count") do
      post :semesters_new, :semester => {year: 2015}
    end

    puts "\t- without year"
    assert_no_difference("Semester.count") do
      post :semesters_new, :semester => {half_year: 2}
    end

    puts "\t- half_year:3"
    assert_no_difference("Semester.count") do
      post :semesters_new, :semester => {year: 2015, half_year: 3}
    end

    puts "\t- title exists"
    assert_no_difference("Semester.count") do
      post :semesters_new, :semester => {year: 2015, half_year: 3, title: "first"}
    end
  end

  test "delete semester" do
    puts __method__
    log_in @user
    assert_difference("Semester.count", -1) do
      post :delete_semester, {semester_id: 1}
    end
  end

  test "go to semester 1 page" do
    puts __method__
    log_in @user
    get :semesters_set, {id: 1}
    assert_response :success
  end

  test "add subject to semester" do
    puts __method__
    log_in @user
    assert_difference("SemestersSubjects.count") do
      post :add_subject_to_semester, {id: 1, subject_id: 1, grade: 2}
    end
  end

  test "not add subject to semester" do
    puts __method__
    log_in @user
    assert_no_difference("SemestersSubjects.count") do
      post :add_subject_to_semester, {id: 2, subject_id: 1, grade: 2}
    end
  end

  test "update subject grade" do
    puts __method__
    log_in @user
    post :change_semester, {id: 2, subject_id: 2, grade: 5, change_grade: true}
    assert_response :found
    semSub = SemestersSubjects.where("subject_id = :suid and semester_id = :seid", {suid: 2, seid: 2})
    assert_equal(5, semSub[0].grade)
  end

  test "delete subject from semester" do
    puts __method__
    log_in @user
    assert_difference("SemestersSubjects.count", -1) do
      post :change_semester, {id: 2, subject_id: 2, delete_subject_from_semester: true}
    end
    assert_response :found
  end

  test "counting credit index" do
    puts __method__
    log_in @user
    puts "\t- delete subject 2"
    assert_difference("SemestersSubjects.count", -1) do
      post :change_semester, {id: 2, subject_id: 2, delete_subject_from_semester: true}
    end
    assert_response :found
    sem = Semester.find(2)
    assert_equal(0.27, sem.credit_index)

    puts "\t- set subject 1's grade to 5"
    post :change_semester, {id: 2, subject_id: 1, grade: 5, change_grade: true}
    sem = Semester.find(2)
    assert_equal(0.67, sem.credit_index)

    puts "\t- set subject 1's credit to 18"
    post :change_subject, {subject_id: 1, change_credit: true, credit: 18}
    assert_response :found
    post :change_semester, {id: 2, subject_id: 1, grade: 5, change_grade: true}
    assert_response :found
    sem = Semester.find(2)
    assert_equal(3.0, sem.credit_index)
  end

end
