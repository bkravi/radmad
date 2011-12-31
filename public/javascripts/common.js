function slideSwitch() {
  var $active = $('#slideshow IMG.active');
  if ( $active.length == 0 ) $active = $('#slideshow IMG:last');
  /*Below code from images in sequence*/
  var $next =  $active.next().length ? $active.next() : $('#slideshow IMG:first');
  /*Below line for random image show*/
  /*var $sibs  = $active.siblings();var rndNum = Math.floor(Math.random() * $sibs.length );var $next  = $( $sibs[ rndNum ] );*/
  $active.addClass('last-active');
  $next.css({opacity: 0.0})
      .addClass('active')
      .animate({opacity: 1.0}, 1000, function() {
          $active.removeClass('active last-active');
      });
}
$(document).ready(function() {
  /* Cycle SlideShow START */
  $('#cycle_pic').cycle({
      fx: 'shuffle',
      speed: 1500,
      pause: 1,
      timeout: 500
     });
  /* Cycle SlideShow END */

  /* Slideshow START */
  /*$(function() {
      setInterval( "slideSwitch()", 2000 );
  });
  */
  /* Slideshow END */
});