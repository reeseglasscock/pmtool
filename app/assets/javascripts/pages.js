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
              prompt: 'Please enter your password'
            }
          ]
        }
      }
    });

  $('form.sign_up_form')
    .form({
      fields: {
        name: {
          identifier: 'user[name]',
          rules: [
            {
              type: 'empty',
              prompt: 'Please enter a name'
            }
          ]
        },
        email: {
          identifier: 'user[email]',
          rules: [
            {
              type: 'empty',
              prompt: 'Please enter your email'
            }
          ]
        },
        password: {
          identifier: 'user[password]',
          rules: [
            {
              type: 'empty',
              prompt: 'Please enter your password'
            }
          ]
        },
        password_confirmation: {
          identifier: 'user[password_confirmation]',
          rules: [
            {
              type: 'empty',
              prompt: 'Please confirm your password'
            }
          ]
        }
      }
    });

  })
