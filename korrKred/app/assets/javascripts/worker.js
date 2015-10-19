$(document).ready(function(){
	$("#add_new_semester_button").on("click", function(){
		var body = document.getElementById("new_semesters");
		var year = document.createElement("input");
		var half_year = document.createElement("input");
		var br = document.createElement("br");
    year.type = "number";
    year.min = new Date().getFullYear() - 1;;
    year.max = new Date().getFullYear() + 2;
    year.className = "year";
    year.name = "semester[year][]"
    half_year.type = "number";
    half_year.className = "half_year";
    half_year.min = "1";
    half_year.max = "2";
    half_year.name = "semester[half_year][]"
		body.appendChild(year);
		body.appendChild(half_year);
		body.appendChild(br);
    $("#save_semesters_button").css("display", "initial");
	})

})