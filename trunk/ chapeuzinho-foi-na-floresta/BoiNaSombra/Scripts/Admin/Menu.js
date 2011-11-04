$(document).ready(function () {

	$("#Menu .MenuOption").each(function () {
		$(this).hover(function () {
			$(this).children("ul").css("display", "block");
		}, function () {
			$(this).children("ul").css("display", "none");
		});
	});
});