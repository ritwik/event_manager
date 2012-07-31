# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.add_ticket = ->
  if window.ticket_count == 10
    return

  window.ticket_count += 1
  $('#ticket_bottom').append(Mustache.render($('#ticket_template').html(), {count: window.ticket_count}))
  
  if window.ticket_count > 1
    $('#ticket_delete').show()
  if window.ticket_count == 10
    $('#ticket_more').hide()
    $('#discount').show()

window.remove_ticket = ->
  if window.ticket_count == 1
    return

  $("#ticket_#{window.ticket_count}").remove()
  window.ticket_count -= 1
  
  if window.ticket_count == 1
    $('#ticket_delete').hide()
  if window.ticket_count < 10
    $('#discount').hide()
    $('#ticket_more').show()

jQuery ->
  if window.ticket_count == 10
    $('#ticket_more').hide()
  else
    $('#discount').hide()
  
  if window.ticket_count == 1
    $('#ticket_delete').hide()
  
  $('#send_payment_form').submit ->
    $('#send_payment').hide()
    $('#send_progress').show()
