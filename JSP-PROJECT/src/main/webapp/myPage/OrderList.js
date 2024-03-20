/**
 * 
 */
$(document).ready(function() {
	$('.btn').click(function() {
		var $tr = $(this).closest('tr');
		var isbn = $tr.find('input[name="isbn"]').val();
		var form = $('<form></form>');
		// form 속성을 설정합니다.
		form.attr('method', 'post');
		form.attr('action', '/book/insertReply.bo');
		// 필드 생성 및 값 설정
		form.append('<input type="hidden" name="isbn" value="' + isbn + '">');
		// form을 body에 추가하고 submit 합니다.
		$('body').append(form);
		form.submit();
	})
});

