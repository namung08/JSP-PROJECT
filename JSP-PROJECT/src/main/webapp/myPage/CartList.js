/**
 * 
 */
$(document).on('click', '.count-btn', function() {
	var btn = $(this);
    var tr = btn.closest('tr');
    var countText = tr.find('.count-text');
    var text = parseInt(countText.val(), 10);
	if (btn.val() == '128465') {
		trash();
	} else if (btn.val() == '8592') {
		if (text == 1) {
			return false;
		}
		text -= 1;
		countText.val(text);
	} else if (btn.val() == '8594') {
		text += 1;
		countText.val(text);
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
