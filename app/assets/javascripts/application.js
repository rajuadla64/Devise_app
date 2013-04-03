// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
function about(){
   var coursename = document.getElementById("coursename").value;
    var gender_male = document.getElementById("male").checked;
    var gender_female = document.getElementById("female").checked;
    var gender_any =document.getElementById("any").checked;
    var rating1 = document.getElementById("rating1").value;
    var rating2 = document.getElementById("rating2").value;
    var paytype = document.getElementById("paytype").value;



    $.ajax({url: '../searching/all',data: 'course_name=' + coursename +'&gender_male='+gender_male +'&gender_female='+gender_female + '&rating1='+rating1 + '&rating2='+rating2+'&paytype='+paytype})


}