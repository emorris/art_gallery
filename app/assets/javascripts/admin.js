$(document).ready(function(){
  window.setTimeout(function() { $(".alert-notice").hide('close'); }, 2000);
  $('.summernote').summernote('code', $('textarea.summernote:first').text())
  
})