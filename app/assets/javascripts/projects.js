$(document).ready(function () {
  $('.message .close')
    .on('click', function () {
      $(this)
        .closest('.message')
        .transition('fade')
        ;
    });
});

$('.add_user_form').load(function () {
  $('.ui.dropdown')
    .dropdown()
    ;
});