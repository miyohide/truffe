$(document).ready ->
  if Modernizr.touch
    $(".image").bind 'touchend', (event) ->
      # console.log("touched")
      btnClick($(this).parent().attr('data-no'))
  else
    $(".image").click ->
      # console.log("clicked")
      btnClick($(this).parent().attr('data-no'))

  setTimeout("scrollTo(0,1)",100)

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
