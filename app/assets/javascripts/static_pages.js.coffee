# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '.create_comment_button', ->
  $(this).prevAll('div.create_comment:first').slideToggle('slow')
  $(this).toggleClass('red_sign')
	
$(document).on 'click', '.show_comment_button', ->
  $(this).prevAll('div.show_comment:first').slideToggle('slow')
  $(this).toggleClass('red_sign')


