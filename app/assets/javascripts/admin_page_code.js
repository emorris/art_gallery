
$(document).ready(function(){
  if ($("#tr-sort-picture").length > 0 ) 
    var sortPictureTr = Handlebars.compile($("#tr-sort-picture").html());
  
  if ($("#loading-file-button").length > 0 ) 
    var loadingFileSpinner   = Handlebars.compile($("#loading-file-button").html());

  window.setTimeout(function() { $(".alert-notice").hide('close'); }, 2000);
  

 
  var summernoteObj =  $('.summernote').summernote({
    toolbar: [
    ['style', ['style']],
    ['font', ['bold', 'italic', 'underline', 'clear']],
    ['color', ['color']],
    ['para', ['ul', 'ol', 'paragraph']],
    ['height', ['height']],
    ['table', ['table']],
    ['insert', ['link', 'picture', 'hr']],
    ['view', ['fullscreen', 'codeview']],
    ['help', ['help']]
  ],
  })
  summernoteObj.summernote('code', $('textarea.summernote:first').text())
  $('#image-upload').fileupload({
    url: $('#image_upload').attr('action'),
    method: "PATCH",
    sequentialUploads: true,
    acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
    done: function (e, data) {
      $("#sortable-pictures-block").append(sortPictureTr(data.result))
    }
  }).on('fileuploaddone', function(e, data){
    $("#"+data.files[0].lastModified).remove()
  }).on('fileuploadadd', function (e, data) {
    var data ={
      file_name: data.files[0].name,
      id: data.files[0].lastModified
    }
    $("#files").append(loadingFileSpinner(data))
  }).prop('disabled', !$.support.fileInput)
      .parent().addClass($.support.fileInput ? undefined : 'disabled');


  $("#sortable-pictures-block").sortable({
    placeholder: "sortable-picture",
    stop: function( event, ui ) {
      $(this).find(".sortable-picture .order-input").each(function(index, obj){
        $(obj).val(index)
      })
    }
  })

  $('#info_picture').on("click", function (e) {
    e.preventDefault()
    $(this).tab('show')
  })

  $('a.delete').on("click", function(e){
    $this = $(this)
    e.preventDefault()
    if (confirm($this.attr('data-confirm'))){
      $.ajax({
        url: $this.attr('href'),
        method: $this.attr('data-method'),
        success: function(){
          var tr = $this.closest('tr')
          tr.next('input').remove()
          tr.remove()
        }
      })
    }
    return false
  })

  $(".date-time-picker").datetimepicker({
    inline: true,
    sideBySide: true,
    allowInputToggle: true,
    format : 'YYYY-MM-DD hh:mm A'
  })
    $(".date-picker").datetimepicker({
    inline: true,
    sideBySide: true,
    allowInputToggle: true,
    format : 'YYYY-MM-DD'
  })

})