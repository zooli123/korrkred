$(document).ready(function(){
  $("#add_new_semester_button").on("click", function(){
    $(".new_semester_div").css("display", "initial");
    $("#save_semester_button").css("display", "initial");
    $("#add_new_semester_button").css("display", "none");
  })

  $("#add_new_subject_button").on("click", function(){
    $(".new_subject_div").css("display", "initial");
    $(".paste_subject_div").css("display", "initial");
    $("#save_subject_button").css("display", "initial");
    $("#add_subject_button").css("display", "initial");
    $("#add_new_subject_button").css("display", "none");
  })

  $("input[name=delete_subject]").on("click", function(e){
    confirmation(e);
  })
  $("input[name=delete_subject_from_semester]").on("click", function(e){
    confirmation(e);
  })

  set_active_page();

  $(".credit_index").on("mouseover", function(){
    var message = gon.label_withdrawn + ": " + gon.withdrawn_credits + "\n" + gon.label_accomplished + ": " + gon.accomplished_credits;
    $(this).prop("title", message)
  })
})

function confirmation(e){
  var confirmation = confirm(gon.are_you_sure);
  if (confirmation == true) {
  } else {
    e.preventDefault();
  }
}

function recognize_page(path){
  var match = /semesters/.test(path);
  var match2 = /semesters\/[0-9]+/.test(path);
  if (match && !match2)
    return "semester";
  match = /subjects/.test(path);
  if (match)
    return "subject"
  return "none"
}

function set_active_page () {
  if (recognize_page(window.location.pathname) == "semester")
    $("#nav_button_semesters").addClass("active");
  else if (recognize_page(window.location.pathname) == "subject")
    $("#nav_button_subjects").addClass("active");
  else{
    $("#nav_button_subjects").removeClass("active");
    $("#nav_button_semesters").removeClass("active");
  }
}
