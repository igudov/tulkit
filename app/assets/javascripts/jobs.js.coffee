# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require s3_direct_upload
jQuery ->
  $("#s3-uploader").S3Uploader()
