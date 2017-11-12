# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('.new_report').validate()
$(document).on 'turbolinks:load',  ->
  if $('.report-date').prop('type') != 'date' 
    $('.report-date').datepicker
      startDate: "-3y"
      endDate: "+0d"
      todayHighlight: true
      orientation: "bottom auto"
      format: "dd/mm/yyyy"
      autoclose: true
      maxViewMode: 2
  $('a').on "click", (event)->
    if this.hash != ""
      event.preventDefault()
      hash = this.hash
      console.log(hash)
      $('html, body').animate
        scrollTop: $(hash).offset().top
        duratin: 800
        easing: "linear"
        ->
          window.location.hash = hash
  $('.state_selection').on "change", ->
    $.ajax
      url: "/locations_for_state"
      type: "GET"
      dataType: "script"
      data:
        state_short_code: $('.state_selection option:selected').val()
      beforeSend: () ->
        $('#report_location_id').prop('disabled', 'disabled')
        $('.field_label').text("Updaing locations...")
      success: () ->
        $('#report_location_id').removeProp('disabled')
        $('.field_label').html('<label for="report_location_id">Location</label> (Required)')
