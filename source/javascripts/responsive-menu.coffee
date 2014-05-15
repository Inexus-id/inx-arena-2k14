window.animateResponsiveNav = ->
  nav = $('#mobile')
  if nav.hasClass('active')
    nav.removeClass('active').animate({ height: "0" }, { duration: "slow" })
  else
    nav.addClass('active').animate({ height: "150px" }, { duration: "slow" })

$ ->
  $('#menu').click ->
    animateResponsiveNav()
