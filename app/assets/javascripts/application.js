// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require tinymce-jquery
//= require twitter/bootstrap
//= require bootstrap
//= require jquery.countdown.min
//= require jquery.timer
//= require jquery_nested_form
//= require_tree .


$(function (){

        $('#user_dob').datepicker({
								    changeMonth: true,
								    changeYear: true,
								    selectOtherMonths: true,
								    dateFormat: "dd/mm/yy" ,
								    yearRange: "1900:2050",
								     maxDate: '+0d'
								});
});
