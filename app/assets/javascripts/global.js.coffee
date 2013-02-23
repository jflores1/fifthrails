$(document).ready ->
	$('.input-small').focus (e) ->
		$(this).addClass('input-large')

	$('.input-small').blur (e) ->
		$(this).removeClass('input-large')