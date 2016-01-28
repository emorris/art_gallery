$(document).ready(function(){
  var window_resize = function() {
    $(".overflow-block").css("height", $( window ).height() - 50)
  }
  $(window).resize(window_resize);
  window_resize()
})

