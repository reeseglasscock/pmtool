$(document).on("turbolinks:load", function () {

  $('.ui.dropdown')
    .dropdown()
    ; 

  $('img.project_avatar')
    .popup()
    ;

  $('.ui.form')
    .form({
      fields: {
        project_user_ids: 'empty',
        prompt: 'Please select at least one user to add.'
      }
    })
    ;

});