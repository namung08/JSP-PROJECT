/**
 * 
 */
// 실패 시 경고창을 띄워줍니다.
setTimeout(ready, 1000);
function errFunc(e) {
	alert("실패: " + e.status);
}
function susFuncJson1(d) {
	console.log(d.items.isbn);
	console.log(d.items.title);
	console.log(d.items.image);
	
}
function susFuncJson2(d) {
	
}
function ready() {
	$.ajax({
		url:"/traffic/traffic.traffic",
		type:"post",
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
