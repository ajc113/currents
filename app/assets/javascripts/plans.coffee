$(document).on 'turbolinks:load',  ->
  console.log("Plans JS loaded")
  $(".preivew-proration").on "ajax:success", (event) ->
    console.log("Ajax call is made")
    console.log(event.detail)
