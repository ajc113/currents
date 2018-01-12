# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $("#subscribe-email-form").on("ajax:success", (event, jqxhr, settings, data) ->
    $(".subscribe-email-form.error").html('')
    $(".subscribe-email-form.success").html('')
    $(".subscribe-email-form.success").html(jqxhr.success)
  ).on("ajax:error", (event, jqxhr, settings, error) ->
    $(".subscribe-email-form.error").html('')
    $(".subscribe-email-form.success").html('')
    $(".subscribe-email-form.error").html(JSON.parse(jqxhr.responseText).error)
  )
