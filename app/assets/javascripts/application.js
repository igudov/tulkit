// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require moment
//= require bootstrap-datetimepicker
//= require turbolinks
//= require s3_direct_upload
//= require_tree .
//= require_self

$(function () {
            $('#datetimepicker8').datetimepicker();
            $('#datetimepicker9').datetimepicker();
            $("#datetimepicker8").on("dp.change",function (e) {
               $('#datetimepicker9').data("DateTimePicker").setMinDate(e.date);
            });
            $("#datetimepicker9").on("dp.change",function (e) {
               $('#datetimepicker8').data("DateTimePicker").setMaxDate(e.date);
            });
        });

$(function () {
	$('.dropdown-toggle').dropdown();
});

$(function (){
	$("#s3-uploader").S3Uploader()
}); 