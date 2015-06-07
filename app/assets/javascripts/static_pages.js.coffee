# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'keyup', '.content_length', ->
  counter = $(this).parent().nextAll('div.char_counter:first')
  char_number = (255 - $(this).val().length)
  counter.text(char_number)     
  counter.css('color', if (char_number < 0) then 'red' else 'black')

$(document).on 'click', '.create_comment_button', ->
  $(this).prevAll('div.create_comment:first').slideToggle('slow')
  $(this).toggleClass('red_sign')

$(document).on 'click', '.show_comment_button', ->
  $(this).prevAll('div.show_comment:first').slideToggle('slow')
  $(this).toggleClass('red_sign')

