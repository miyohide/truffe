$(document).ready(function(){
  /* This code is executed after the DOM has been completely loaded */
  
  var totWidth=0;
  var positions = new Array();
  
  $('#slides .slide').each(function(i){
    positions[i]= totWidth;
    console.log('positions'+i+':'+positions[i]);
    totWidth += $(this).width();
    if(!$(this).width()){
      alert("Please, fill in width & height for all your images!");
      return false;
    }
    
  });
  
  $('#slides').width(totWidth);
  console.log('totWidth:'+totWidth);


  //$('#menu ul li').click(function(e,keepScroll){
  $menuItem = $(".menuitem");
  $menuItem.on({
    "touchstart click" : function(e) {
    },
    "touchend click" : function(e,keepScroll) {
      console.log('#menu ul li:clicked');
      $menuItem.removeClass('act').addClass('inact');
      $(this).removeClass('inact').addClass('act');
      
      var pos = $(this).prevAll('.menuitem').length;
      
      $('#slides').stop().animate({marginLeft:-positions[pos]+'px'},450);
      
      e.preventDefault();
      
      // Stopping the auto-advance if an icon has been clicked:
      if(!keepScroll) clearInterval(itvl);
                }
        });
  
  /* On page load, mark the first thumbnail as active */
  $('#menu ul li.menuitem:first').addClass('act').siblings().addClass('inact');
  
  
  
  /*****
   *
   *  Enabling auto-advance.
   *
   ****/
   
  var current=1;

  function autoAdvance(){
    console.log('called autoAdvance');
    if(current==-1) return false;
    
    //slide_images(current);
    $('#menu ul li').eq(current%$('#menu ul li').length).trigger('ontouchend',[true]);
    // [true] will be passed as the keepScroll parameter of the click function on line 28
    current++;
  }

  var changeEvery = 3;
  var itvl = setInterval(function(){autoAdvance()},changeEvery*1000);


function slide_images(current) {
  $obj = $('#menu ul li').eq(current%$('#menu ul li').length)
  console.log('$obj:clicked');
  $menuItem = $(".menuitem");
  $menuItem.removeClass('act').addClass('inact');
  $obj.addClass('act');
  
  var pos = $obj.prevAll('.menuitem').length;
  
  $('#slides').stop().animate({marginLeft:-positions[pos]+'px'},450);
  
  // Stopping the auto-advance if an icon has been clicked:
//  if(!keepScroll) clearInterval(itvl);
}




});
