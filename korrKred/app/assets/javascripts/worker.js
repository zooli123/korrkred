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

  $("input[name=delete_subject]").on("click", function(e){
    confirmation(e);
  })
  $("input[name=delete_subject_from_semester]").on("click", function(e){
    confirmation(e);
  })

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