$(document).on 'change', '#character_clan', ->
  character_clan = $(this).val()
  character_name = $('#character_name').val()
  character_desc = $('#character_desc').val()
  $.get(window.location, { name: character_name, clan: character_clan, desc: character_desc  }) ->

