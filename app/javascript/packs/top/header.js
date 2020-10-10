$(document).ready(function () {
  $('.link_have_dropdown_sm').click(function (e) { 
    $(this).toggleClass('active')
    $('.list_menu_language').toggleClass('active')
    $('.overlay_for_header').toggleClass('active')
  });

  $('.overlay_for_header').click(function (e) { 
    $(this).removeClass('active');
    $('.list_menu_language').removeClass('active')
    $('.link_have_dropdown_sm').removeClass('active')
  });

  $('.cart_or').hover(function () {
      $(this).css('display', 'none')
      $('.car_rd').css('display', 'block')
    }
  );

  $('.car_rd').hover(function () {
  }, function () {
    $('.cart_or').css('display', 'block')
    $('.car_rd').css('display', 'none')
    }
  );




































  $('.menu_item_lang a').click(function (e) { 
    $('.header_top__menu_lang').toggleClass('enable_box_lag');
    $('.overlay_for_header').toggleClass('enable_box_lag');
    $('.menu_item_lang').toggleClass('dr_up');
    $(this).toggleClass('enable_link');
  });

  $('.overlay_for_header').click(function (e) { 
    $(this).removeClass('enable_box_lag');
    $('.header_top__menu_lang').removeClass('enable_box_lag');
    $('.menu_item_lang a').removeClass('enable_link');
    $('.menu_item_lang').removeClass('dr_up');
  });

  setTimeout(function() {
    $('.header_top_vertical').addClass('enable_menu_vertical');
  }, 1200)

  // => scroll to top
  $(window).scroll(function(){
    if ($(this).scrollTop() > 500) {   
        $(".header_top_vertical__list_item.scroll_top").css('transform','translateY(0)');       
        $(".menu_vertical_scroll_top").css('transition', '0.4s');
    } else {
      $(".header_top_vertical__list_item.scroll_top").css('transform','translateY(100%)');       
      $(".menu_vertical_scroll_top").css('transition', '0.4s');}
  });
  $(".menu_vertical_scroll_top").click(function (e){
    var body = $("html, body");
    $('.header_top_vertical__list_item .popup_menu_vertical').removeClass('animate_popup');
    body.stop().animate({ scrollTop: 0}, 700, 'swing')
  });
  // => end

  $('.header_top_vertical__list_item').hover(function () {
      $(this).find('.popup_menu_vertical').addClass('animate_popup');
    }, function () {
      $(this).find('.popup_menu_vertical').removeClass('animate_popup');
    }
  );

});


