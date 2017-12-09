$(document).on 'turbolinks:load', ->
	$(document).on 'ajax:success', '.delete-comment', ->
		$(this).closest('.comment').remove()
	$(document).on 'click', '.delete-comment', ->
		alert 'yup'