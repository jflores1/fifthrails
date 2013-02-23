$(document).ready ->
	$('.input-small').focus (e) ->
		$(this).addClass('span2')

	$('.input-small').blur (e) ->
		$(this).removeClass('span2')