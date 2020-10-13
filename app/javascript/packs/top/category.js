$(document).ready(function () {
  function hoverCategory(pst) {
    $('.list_item_category_top[data-category='+pst+']').hover(function () {
      $(".menu_inside_banner[data-position="+(pst)+"]").css("display", "block");
      }, function () {
        $(".menu_inside_banner").css("display", 'none');
      }
    );
    $(".menu_inside_banner[data-position="+(pst)+"]").hover(function () {
      $(this).css("display", 'block');
      $('.list_item_category_top[data-category='+pst+']').addClass('active');
      }, function () {
        $(this).css("display", 'none');
        $('.list_item_category_top[data-category='+pst+']').removeClass('active');
      }
    );
  }

  a = [1, 2, 3, 4, 5, 6]
  a.forEach(function(v, k){
    hoverCategory(v)
  });
});