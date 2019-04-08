# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  sidebar = $('.posts-sidebar')
  if sidebar.length
    delete top
    delete y
    top = sidebar.offset().top

    $(window).scroll (event) ->
      y = $(this).scrollTop()
      if y >= top
        sidebar.addClass('fixed')
      else
        sidebar.removeClass('fixed')
