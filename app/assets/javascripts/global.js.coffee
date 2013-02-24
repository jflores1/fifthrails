$(document).ready ->
	$('.input-small').focus (e) ->
		$(this).addClass('input-large')

	$('.input-small').blur (e) ->
		$(this).removeClass('input-large')

	$('#datepicker').datepicker({
    minDate: +1,
    dateFormat:"yy-mm-dd"
  })