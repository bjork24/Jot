$(function(){

  $('#entry_body').keyup(function(){
    $obj = $(this);
    delay(function(){
      var count = $obj.val().length;
      var countJar = $('#entry-word-count');
      if(count <= 475 && countJar.hasClass('warn')) countJar.removeClass('warn');
      else if(count > 475 && count <= 500) countJar.addClass('warn');
      else if(count > 500) $obj.val($obj.val().substring(0,500));
      countJar.text(count);
    }, 500);
  });

});

var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout(timer);
    timer = setTimeout(callback, ms);
  };
})();