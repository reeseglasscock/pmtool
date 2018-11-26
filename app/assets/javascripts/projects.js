$(document).on("turbolinks:load", function () {

  $(window).resize(function () {
    if (window.innerWidth < 700) { //Some arbitrary mobile width
      $(".sidebar").addClass('top').removeClass('left');
      $('.ui.sidebar').sidebar('toggle')
    } else {
      $(".sidebar").removeClass('top').addClass('left');
    }
  });
  
  // $('.nav_logo_icon').on('click', function (event) {
  //   console.log("clicked")
  //   $('.ui.sidebar')
  //     .sidebar('toggle')
  // })

  $('.ui.dropdown')
    .dropdown()
    ; 

  $('img.project_avatar')
    .popup()
    ;

  $('form.ui.form.add_user')
    .form({
      fields: {
        project_user_ids: {
          identifier: 'project_user_ids',
          rules: [
            {
              type: 'empty',
              prompt: 'Please select at least one user to add.'
            }
          ]
        }
      }
    });
  
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
    });
    
  $('form.ui.large.form.new_project_form')
    .form({
      fields: {
        title: {
          identifier: 'project_title',
          rules: [
            {
              type  : 'empty',
              prompt: 'Please enter a title'
            }
          ]
        },
        description: {
          identifier: 'project_description',
          rules: [
            {
              type  : 'empty',
              prompt: 'Please add a description'
            }
          ]
        }
      }
    })



  $(".display_add_user_form").hide();
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
  $("a#project_details").on('click', function(event) {
    event.preventDefault()
    show_project_details()
  })
});

function show_edit_project() {
  $('a#edit_project').addClass('active')
  $('a#members').removeClass('active')
  $('a#posts').removeClass('active')
  $('a#project_details').removeClass('active')
  $(".display_add_user_form").show();
  $(".display_project_posts").hide();
  $(".display_remove_members_form").hide();
  $(".display_project_details").hide();
};

function show_project_members() {
  $('a#members').addClass('active')
  $('a#edit_project').removeClass('active')
  $('a#posts').removeClass('active')
  $('a#project_details').removeClass('active')
  $(".display_add_user_form").hide();
  $(".display_project_posts").hide();
  $(".display_remove_members_form").show();
  $(".display_project_details").hide();
}

function show_project_posts() {
  $('a#members').removeClass('active')
  $('a#edit_project').removeClass('active')
  $('a#posts').addClass('active')
  $('a#project_details').removeClass('active')
  $(".display_add_user_form").hide();
  $(".display_project_posts").show();
  $(".display_remove_members_form").hide();
  $(".display_project_details").hide();
}

function show_project_details() {
  $('a#members').removeClass('active')
  $('a#edit_project').removeClass('active')
  $('a#posts').removeClass('active')
  $('a#project_details').addClass('active')
  $(".display_add_user_form").hide();
  $(".display_project_posts").hide();
  $(".display_remove_members_form").hide();
  $(".display_project_details").show();
}