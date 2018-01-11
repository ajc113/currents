# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $("#subscribe-email-form").on("ajax:success", (event) ->
    console.log("form success")
    [data, status, xhr] = event.detail
    $("#subscribe-email-form.error").val('')
    $("#subscribe-email-form").append xhr.responseText
  ).on("ajax:error", (event, jqxhr, settings, error) ->
    $("#subscribe-email-form.error").val('')
    $("#subscribe-email-form.error").val JSON.parse(jqxhr.responseText).error
  )
