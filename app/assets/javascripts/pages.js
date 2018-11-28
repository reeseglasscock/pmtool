// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on("turbolinks:load", function () {

  $('form.log_in')
    .form({
      fields: {
        email: {
          identifier: 'user[email]',
          rules: [
            {
              type: 'empty',
              prompt: 'Please enter a email'
            }
          ]
        },
        password: {
          identifier: 'user[password]',
          rules: [
            {
              type: 'empty',
              prompt: 'Please add a password'
            }
          ]
        }
      }
    });

  })
