$(document).ready ->
  if Modernizr.touch
    $(".image").bind 'touchend', (event) ->
      btnClick($(this).parent().attr('data-no'))
  else
    $(".image").click ->
      btnClick($(this).parent().attr('data-no'))

  setTimeout("scrollTo(0,1)",100)

  if Modernizr.touch
    $("#menu_lists").bind 'touchend', (event) ->
      viewLists()
  else
    $("#menu_lists").click ->
      viewLists()

  if Modernizr.touch
    $("p.flash").bind 'touchend', (event) ->
      hideFlash()
  else
    $("p.flash").click ->
      hideFlash()

btnClick = (num) ->
  # console.log(num)
  $selectedImage = $('li[data-no=' + num + ']')
  if $selectedImage.hasClass('show')
    $('ul#photos_list > li').removeClass('show')
    $('.background').css('display', 'none')
  else
    $('.background').css('display', 'block')
    $('ul#photos_list > li').removeClass('show')
    $selectedImage.addClass('show')

viewLists = () ->
  $lists = $('#pulldown_nav')
  if $lists.hasClass('show')
    $lists.removeClass('show')
    $lists.css('display', 'none')
  else
    $lists.css('display', 'block')
    $lists.addClass('show')

hideFlash = () ->
  $flash = $('p.flash')
  $flash.css('display', 'none')
