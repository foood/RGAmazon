# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#order_bill_to_shipp').click ->
    if $('#order_bill_to_shipp').is(':checked')
      $('#ship_div').hide 'fast'
    else
      $('#ship_div').show 'fast'
    return
  return