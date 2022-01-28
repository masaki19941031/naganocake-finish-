/* global $*/
document.addEventListener("turbolinks:load", function() {
$(function(){
  $('.item-image-slide').slick({
    autoplay: true,
    autoplaySpeed: 0,
    speed: 8000,
    cssEase: "linear",
    slidesToShow: 2,
    swipe: false,
    arrows: false,
    pauseOnFocus: false,
    pauseOnHover: false

  });


　});
});