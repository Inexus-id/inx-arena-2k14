window.slideActive = false

window.findNextSlide = (direction) ->
  nextSlide = []
  if direction == 'prev'
    nextSlide = $('.home-header-slide.active').prev('.home-header-slide')
    nextSlide = $('.home-header-slide:last') unless nextSlide.length
  else
    nextSlide = $('.home-header-slide.active').next('.home-header-slide')
    nextSlide = $('.home-header-slide:first') unless nextSlide.length
  nextSlide

window.findPrevSlide = (slide, direction) ->
  prevSlide = []
  if direction == 'prev'
    prevSlide = slide.next('.home-header-slide')
    prevSlide = $('.home-header-slide:first') unless prevSlide.length
  else
    prevSlide = slide.prev('.home-header-slide')
    prevSlide = $('.home-header-slide:last') unless prevSlide.length
  prevSlide

window.moveSlide = (direction) ->
  if slideActive then false
  slideIntervalRestart()
  slideActive = true
  nextSlide = findNextSlide(direction)
  currentSlide = findPrevSlide(nextSlide, direction)
  currentSlide.addClass('exit')
  nextSlide.addClass('enter')

  currentSlide.on('webkitAnimationEnd oanimationend msAnimationEnd animationend', ->
    $(this).removeClass('active').removeClass('exit'))
  nextSlide.on('webkitAnimationEnd oanimationend msAnimationEnd animationend', ->
    slideActive = false
    $(this).removeClass('enter').addClass('active'))

window.slideIntervalRestart = ->
  clearInterval window.slideInterval
  window.slideInterval = setInterval(moveSlide, 4000)

$ ->
  window.slideInterval = setInterval(moveSlide, 4000)
