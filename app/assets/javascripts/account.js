//= require jquery
//= require jquery_ujs
//= require account/jquery.uniform.min

$(function() {
	// Табы
	$('.tabs__content:last-child').prev().addClass('last');
	$( '.tabs > .tabs__title:first-child' ).next('dd').andSelf().addClass('active');
	$('.tabs__title').click(function(){
		$(this)
			.siblings().removeClass('active').end()
			.next('dd').andSelf().addClass('active');
	});
})