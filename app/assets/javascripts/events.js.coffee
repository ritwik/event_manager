# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.ticket_count = 0

window.add_ticket = ->
  window.ticket_count += 1
  $('#ticket_bottom').append(Mustache.render($('#ticket_template').html(), {count: ticket_count}))

jQuery ->
  window.add_ticket()
  
