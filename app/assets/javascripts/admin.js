$(document).ready(function(){
  window.setTimeout(function() { $(".alert-notice").hide('close'); }, 2000);
  
  $('.summernote').summernote('code', $('textarea.summernote:first').text())
  
  $('#image-upload').fileupload({
    url: $('#image_upload').attr('action'),
    sequentialUploads: true,
    acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
    done: function (e, data) {
      $("#sortable-pictures-block").append(sortPictureTr(data.result))
    },
    progressall: function (e, data) {
      var progress = parseInt(data.loaded / data.total * 100, 10);
      //$("#"+data.files[0].name).append(progress)
      // console.log(progress)
      // $('#progress .progress-bar').css(
      //     'width',
      //     progress + '%'
      // );
    }
  }).on('fileuploadadd', function (e, data) {
    $("#files").append($("<div/>").attr("id", data.files[0].name ).text(data.files[0].name ))
  }).prop('disabled', !$.support.fileInput)
      .parent().addClass($.support.fileInput ? undefined : 'disabled');
   
  var source   = $("#tr-sort-picture").html();
  var sortPictureTr = Handlebars.compile(source);

 $("#sortable-pictures-block").sortable({
    placeholder: "sortable-picture",
    stop: function( event, ui ) {
      $(this).find(".sortable-picture .order-input").each(function(index, obj){
        $(obj).val(index)
      })
    }
 })

})