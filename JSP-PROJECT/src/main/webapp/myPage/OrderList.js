/**
 * 
 */
$(document).ready(function() {
	$('.btn').click(function() {
		var $tr = $(this).closest('tr');
		var isbn = $tr.find('input[name="isbn"]').val();
	})
});

