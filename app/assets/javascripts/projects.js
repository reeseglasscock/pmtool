$(document).on("turbolinks:load", function () {
  $('.ui.dropdown')
    .dropdown()
    ; 

  $('img.project_avatar')
    .popup()
    ;

  $('.ui.form.add_user')
    .form({
      fields: {
        project_user_ids: 'empty',
        prompt: 'Please select at least one user to add.'
      }
    })
    ;
  
  $('form.ui.form.add_post_to_project')
    .form({
      fields: {
        title: {
          identifier: 'title',
          rules: [
            {
              type  : 'empty',
              prompt: 'Please enter a title'
            }
          ]
        },
        comment: {
          identifier: 'comment',
          rules: [
            {
              type  : 'empty',
              prompt: 'Please add a comment'
            }
          ]
        }
      }
    })  

  $(".display_remove_members_form").hide();
  $(".display_add_user_form").hide();

  $("a#edit_project").on('click', function(event) {
    event.preventDefault()
    show_edit_project()
  })
  $("a#members").on('click', function(event) {
    event.preventDefault()
    show_project_members()
  })
  $("a#posts").on('click', function(event) {
    event.preventDefault()
    show_project_posts()
  })
});

function show_edit_project() {
  $('a#edit_project').addClass('active')
  $('a#members').removeClass('active')
  $('a#posts').removeClass('active')
  $(".display_add_user_form").show();
  $(".display_project_posts").hide();
  $(".display_remove_members_form").hide();
};

function show_project_members() {
  $('a#members').addClass('active')
  $('a#edit_project').removeClass('active')
  $('a#posts').removeClass('active')
  $(".display_add_user_form").hide();
  $(".display_project_posts").hide();
  $(".display_remove_members_form").show();
}

function show_project_posts() {
  $('a#members').removeClass('active')
  $('a#edit_project').removeClass('active')
  $('a#posts').addClass('active')
  $(".display_add_user_form").hide();
  $(".display_project_posts").show();
  $(".display_remove_members_form").hide();
}