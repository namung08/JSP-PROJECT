/**
 * 
 */
// 실패 시 경고창을 띄워줍니다.
setTimeout(ready, 1000);
function errFunc(e) {
	alert("실패: " + e.status);
}
function susFuncJson1(d) {
	var str = "";
	$.each(d, function(index, item) {
		// item.discount의 돈 단위로 서식 바꾸기
		console.log("index : " + index);
		// 화폐 정규식 표현
		const discount = item.discount;
		//const discount1 = discount.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		const pubdate = item.pubdate;
		//const pubdate1 = pubdate.replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3');
		str += "<ul>";
		str += "	<input type='hidden' name='isbn' value=" + item.isbn + ">";
		str += "    <li name='title' id='title'> 제목 : " + item.title + "</li>";
		str += '	<input type="hidden" name="title" value="' + item.title + '">';
		str += "    <img name='image' id='image' src='" + item.image + "'width='304' height='228' >";
		str += '	<input type="hidden" name="image" value="' + item.image + '">';
		str += "</ul>";
	});
	console.log(str);
	$('#traffic').html(str);
}
function susFuncJson2(d) {

}
function ready() {
	$.ajax({
		url: "/traffic/traffic.traffic",
		type: "post",
		dataType: "json",
		success: function(data) {
			susFuncJson1(data);
		},
		error: errFunc
	});
	/*$.ajax({
		url:"/traffic/order-traffic.traffic",
		type:"post",
		dataType: "json",
		success: function(data) {
			susFuncJson2(data);
		},
		error: errFunc
	});*/
	return false;
};
