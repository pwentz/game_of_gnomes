$(document).ready(function(){

  var $gnomes = $('.gnome');

  $gnomes.each(function(index, gnome){
    $(gnome).on('mouseenter', function(){
      if ($(gnome).find('#more-button').is(':hidden')){
        $(gnome).find('#more-button').slideToggle(500);
      }
    });
    $(gnome).on('mouseleave', function(){
      $(gnome).find('#more-button').slideToggle(500);
    });
    $(gnome).find('#more-button').on('click', function(){
      if ($(gnome).hasClass('retired')){
        $(gnome).find('a').removeAttr('href');
        $(gnome).find('img').replaceWith("<img class='thumbnail' src='http://blog.arkieva.com/wp-content/uploads/2015/09/stockout.jpg'>");
      }
    });
  });

  $(window).on('scroll', function() {
    if ($(this).scrollTop() > 1){
      $('.navbar').addClass('sticky');
      $('.navbar').find('.menu-text').fadeOut(50);
      $('.top-bar-right').addClass('minify');
      $('.navbar').find('.category-dropdown').fadeOut(50);
    }
    else {
      $('.navbar').removeClass('sticky');
      $('.navbar').find('.menu-text').fadeIn(50);
      $('.top-bar-right').removeClass('minify');
      $('.navbar').find('.category-dropdown').fadeIn(50);
    }
  });


});
