# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change','#topic_id', ->
	window.location.replace($(this).val())
	
$(document).on 'click', '.select_all_clans', ->
  if $(this).is ':checked' then $('.clan_checkbox').prop 'checked', true    

$(document).on 'click', '.select_all_classes', ->
  if $(this).is ':checked' then $('.class_checkbox').prop 'checked', true
