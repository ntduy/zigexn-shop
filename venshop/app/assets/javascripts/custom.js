var ready = function () {
	var menu = $('.menu');
	var origOffsetY = menu.offset().top;

	function scroll() {
		if ($(window).scrollTop() > origOffsetY) {
			$('.menu').addClass('navbar-fixed-top');
		} else {
			$('.menu').removeClass('navbar-fixed-top');
		}
	}
	document.onscroll = scroll;
};

$(document).ready(ready);
$(document).on('page:load', ready);