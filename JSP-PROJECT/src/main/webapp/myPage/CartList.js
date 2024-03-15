/**
 * 
 */

$(document).on('click', '.count-btn', function() {
	var clickbtn = $(this);
	var btnval = clickbtn.val();
	if (btnval == '128465') {
		trash();
	} else if (btnval == '8592') {
		left();
	} else if (btnval == '8594') {
		right();
	}
});
function trash() {
	var trElement = $('#cartResult');
	// tr 요소 안에 있는 정보를 가져옴
	var cartNum = trElement.find('input[name="cartNum"').val();
	var form = $('<form></form>');

	// form 속성을 설정합니다.
	form.attr('method', 'post');
	form.attr('action', '/delete/CartBook.bo');
	// 필드를 생성하고 값을 설정합니다.
	form.append('<input type="hidden" name="cartNum" value="' + cartNum + '">');
	
	// form을 body에 추가하고 submit 합니다.
	$('body').append(form);
	form.submit();
}
function left() {
	var text = parseInt($('.count-text').val(), 10);
	if (text == 1) {
		return false;
	}
	text -= 1;
	$('.count-text').val(text);
}
function right() {
	var text = parseInt($('.count-text').val(), 10);
	text += 1;
	$('.count-text').val(text);
}