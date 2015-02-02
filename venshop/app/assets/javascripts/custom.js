var ready = function () {
	var menu = $('.menu');
	var origOffsetY = menu.offset().top;

	function scroll() {
		if ($(window).scrollTop() >= origOffsetY) {
			$('.menu').addClass('navbar-fixed-top');
		} else {
			$('.menu').removeClass('navbar-fixed-top');
		}
	}
	document.onscroll = scroll;

	$(".product-item").hover(function() {
		$(".quickview",this).show( 200 );
	});

	$(".product-item").mouseleave(function() {
		$(".quickview",this).hide( 100 );
	});

	$(".cart").hover(function() {
		$(".table-cart").show( 500 );
	});

	$(".table-cart").mouseleave(function() {
		$(".table-cart").hide( 300 );
	});

	// $(".cart").mouseleave(function() {
	// 	$(".table-cart").hide( 300 );
	// });
};

$(document).ready(ready);
$(document).on('page:load', ready);