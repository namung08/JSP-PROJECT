/**
 * 
 */

/*$(document).ready(function() {
	$.ajax({
		url: "/search/CartList.bo",
		type: "post",
		async: true,
		sussess: function(data) {
			spreadCart(data);
			createPagination(data);
		},
		error: errFunc
	});
	return false;
})*/

function spreadCart(d) {
	console.log(d);
}

function createPagination(d) {
	
}

function errFunc(e) {
	alert("실패: " + e.status);
}