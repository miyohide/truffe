$(document).ready(function(){
  $('#slides').width('485px');

  $menuItem = $(".menuitem");
  $menuItem.on({
    "touchstart click" : function(e) {
    },
    "touchend click" : function(e,keepScroll) {
      $menuItem.removeClass('act').addClass('inact');
      $(this).removeClass('inact').addClass('act');
      
      var pos = $(this).prevAll('.menuitem').length;
      
      $('.slide').eq(pos).stop().animate({'opacity':1},450).siblings().stop().animate({'opacity':0},450);
      
      e.preventDefault();
      
      // Stopping the auto-advance if an icon has been clicked:
      if(!keepScroll) clearInterval(itvl);
    }
  });
  
  /* On page load, mark the first thumbnail as active */
  $('.slide:first').css('opacity',1).siblings().css('opacity',0);
  $('#menu li.menuitem:first').addClass('act').siblings().addClass('inact');
  
  
  /*****
   *
   *  Enabling auto-advance.
   *
   ****/
   
  var current=1;

  function autoAdvance(){
    if(current==-1) return false;
    
    slide_images(current);
    $('#menu li').eq(current%$('#menu li').length).trigger('ontouchend',[true]);
    current++;
  }

  var changeEvery = 4;
  var itvl = setInterval(function(){autoAdvance()},changeEvery*1000);

  function slide_images(current) {
    $obj = $('#menu li').eq(current%$('#menu li').length)
    $menuItem = $('.menuitem');
    $menuItem.removeClass('act').addClass('inact');
    $obj.addClass('act');
    
    var pos = $obj.prevAll('.menuitem').length;
    
    $('.slide').eq(pos).stop().animate({'opacity':1},550).siblings().stop().animate({'opacity':0},550);
  }
});
