$(document).ready(function () {
  /*menu bar1 */
  //   $(".menu_bar1").mouseover(function () {
  //     $(this).children(".submenu").stop().slideDown()
  //   })
  //   $(".menu_bar1").mouseleave(function () {
  //     $(this).children(".submmenu").stop.slideUp()
  //   })
  /*menu bar2 */
  $(".menu_bar2").mouseover(function () {
    $(this).children(".submenu").show(0)
  })
  $(".menu_bar2").mouseleave(function () {
    $(this).children(".submenu").hide(0)
  })
})
