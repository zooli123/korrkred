$(document).ready(function(){
  $("#add_new_semester_button").on("click", function(){
    $(".new_semester_div").css("display", "initial");
    $("#save_semester_button").css("display", "initial");
  })
  $("#add_new_subject_button").on("click", function(){
    $(".new_subject_div").css("display", "initial");
    $(".paste_subject_div").css("display", "initial");
    $("#save_subject_button").css("display", "initial");
    $("#add_subject_button").css("display", "initial");
  })
})