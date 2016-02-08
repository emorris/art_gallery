var mobileScroll = function(){
  var offset = $("#info-space").offset().top - 45
  if (offset  <  $( window ).height()  - 600 ) return
  $('html, body').animate({
    scrollTop: offset
  }, 1000);
}