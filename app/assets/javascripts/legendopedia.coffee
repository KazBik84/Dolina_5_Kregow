# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change','#topic_id', ->
	window.location.replace($(this).val())
	
$(document).on 'click','.select_all_clans', ->
    $('.clan_checkbox').attr 'checked', true

$(document).on 'click','.select_all_classes', ->
    $('.class_checkbox').attr 'checked', true	
