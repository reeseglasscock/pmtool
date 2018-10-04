$(document).on("turbolinks:load", function () {

  $('.message .close')
  .on('click', function () {
    $(this)
      .closest('.message')
      .transition('fade')
      ;
  });

  $('.ui.dropdown')
    .dropdown()
    ; 

  $('img.avatar.image')
    .popup()
    ;

});