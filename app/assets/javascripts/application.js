// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery
//= require jquery_ujs

function geolocationSuccess(position) {
  // check if the location input value are empty and fill them with if so.
  if (document.getElementById('secret_location_latitude').value == "") {
  document.getElementById('secret_location_latitude').value = position.coords.latitude;
  document.getElementById('secret_location_longitude').value = position.coords.longitude;
  }
};

function geolocationError(error) {
  // it handles errors
  x = document.getElementById('location_errors')
  switch(error.code) {
    case error.PERMISSION_DENIED:
      x.innerHTML = "User denied the request for Geolocation."
      x.style.border = "1px solid red"
      break;
    case error.POSITION_UNAVAILABLE:
      x.innerHTML = "Location information is unavailable."
      x.style.border = "1px solid red"
      break;
    case error.TIMEOUT:
      x.innerHTML = "The request to get user location timed out."
      x.style.border = "1px solid red"
      break;
    case error.UNKNOWN_ERROR:
      x.innerHTML = "An unknown error occurred."
      x.style.border = "1px solid red"
      break;
    }
};
