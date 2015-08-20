# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change','#topic_id', ->
  window.location.replace($(this).val())

$(document).on 'click', '.select_all_clans', ->
  if $(this).is ':checked' then $('.clan_checkbox').prop 'checked', true

$(document).on 'click', '.select_all_classes', ->
  if $(this).is ':checked' then $('.class_checkbox').prop 'checked', true
  
$(document).on 'click', '.select_all_spells', ->
  if $(this).is ':checked' then $('.spell_checkbox').prop 'checked', true
  
$(document).on 'click', '.select_all_rings', ->
  if $(this).is ':checked' then $('.ring_checkbox').prop 'checked', true
  
$(document).on 'click', '.select_all_tags', ->
  if $(this).is ':checked' then $('.tag_checkbox').prop 'checked', true
  
$(document).on 'click', '.advance_school_button', ->
  $(this).toggleClass('red_sign')
  $('.advance_school_form').slideToggle('slow')
  $('.simple_school_form').slideToggle('slow')
  
$(document).on 'click', '.advance_spell_button', ->
  $(this).toggleClass('red_sign')
  $('.advance_spell_form').slideToggle('slow')
  $('.simple_spell_form').slideToggle('slow')
  
$(document).on 'click', '.advance_traits_button', ->
  $(this).toggleClass('red_sign')
  $('.advance_traits_form').slideToggle('slow')
  $('.simple_traits_form').slideToggle('slow')
