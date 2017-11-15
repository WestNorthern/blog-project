$(document).on 'turbolinks:load', ->
	$('.delete-comment').on 'ajax:success', ->
		$(this).closest('.comment').remove()