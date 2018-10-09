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
  $(".display_project_posts").hide();
  $(".display_remove_members_form").hide();

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
  console.log("Reached Show Edit Project")
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