// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(function() { 
	
	// init zurb foundation
	$(document).foundation(); 

	/* init banners */
	$('.banners').slick({
	  	  dots: true,
		  infinite: true,
		  speed: 1000,
		  slidesToShow: 1,
		  touchMove: true,
		  autoplay: true,
		  autoplaySpeed: 10000,
	});
	
	// init map
	google.maps.event.addDomListener(window, 'load', initialize);
});

function initialize() {
        var map_canvas = document.getElementById('map_canvas');
		var latLong = new google.maps.LatLng(46.510874, -84.332301);
        var map_options = {
          center: latLong,
          zoom: 18,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(map_canvas, map_options)

		var marker = new google.maps.Marker({
		      position: latLong,
		      map: map,
		      title: '473 Queen E',
		  });
}


