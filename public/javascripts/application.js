$(function(){

  $('[data-range]').each(function(){
    $obj = $(this);
    id = $obj.attr('id');
    $obj.after('<span id="'+id+'_count">0</span>');
    $obj.bind('keyup',function(){
      $obj = $(this);
      max = parseInt($obj.data('range'));
      warn = max - 25;
      countJar = $('#'+$obj.attr('id')+'_count');
      delay(function(){
        var count = $obj.val().length;
        if(count <= warn && countJar.hasClass('warn')) {
          countJar.removeClass('warn');
        } else if(count > warn && count <= max) {
          countJar.addClass('warn');
        } else if(count > max) {
          $obj.val($obj.val().substring(0,max));
          count = max;
        }
        countJar.text(count);
      }, 200);
    });
  });
  
  $('#entry_pain').change(function(){
    $('#entry-pain-value').text($(this).val());
  });

});

var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout(timer);
    timer = setTimeout(callback, ms);
  };
})();