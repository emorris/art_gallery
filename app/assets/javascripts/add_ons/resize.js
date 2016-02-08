var window_resize = function() {
  if ( $( window ).width() <= 768){
    $(".overflow-block").css("height","")
    return
  }
  $(".overflow-block").css("height", $( window ).height() - 50)
}

$(document).ready(function(){
  $("#dashboard").on('click','a', function(){
    window_resize()
  })

  $(window).resize(window_resize);
  $('.overflow-block').resize(window_resize);
  window_resize()
})

