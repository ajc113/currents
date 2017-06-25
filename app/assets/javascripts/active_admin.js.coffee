#= require active_admin/base
$(document).ready ->
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
