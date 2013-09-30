//= require jquery
//= require jquery_ujs
//= require jquery_nested_form
//= require account/jquery.uniform.min
//= require account/twitter-bootstrap-hover-dropdown.min

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