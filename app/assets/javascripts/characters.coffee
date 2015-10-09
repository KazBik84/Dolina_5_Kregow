$(document).on 'change', '#character_clan', ->
  chosen_clan = $(this).val()
  $.get(window.location, { clan: chosen_clan }) ->

