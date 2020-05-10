# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', =>
  $('#admin_no_group').css('display', 'none') if $('#user_user_role').val() is 'teacher'

  $('#user_user_role').change ->
    if $('#user_user_role').val() is 'teacher'
      $('#admin_no_group').css('display', 'none')
    else
      $('#admin_no_group').css('display', 'block')
