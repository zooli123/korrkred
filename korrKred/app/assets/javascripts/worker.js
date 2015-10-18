$(document).ready(function(){
	$("#add_new_semester_button").on("click", function(){
		var body = document.getElementById("new_semesters");
		var year = document.createElement("input");
		var half_year = document.createElement("input");
		var br = document.createElement("br");
    year.type = "number";
    year.min = "1970";
    year.max = "3000";
    year.className = "year";
    half_year.type = "number";
    half_year.className = "half_year";
    half_year.min = "1";
    half_year.max = "2";
		body.appendChild(year);
		body.appendChild(half_year);
		body.appendChild(br);
	})
	for(var i = 0; i < gon.semesters.length; i++){
		console.log(gon.semesters[i].id);
	}
})