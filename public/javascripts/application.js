$(document).ready(function(){

  $('#entry_body').keyup(function(){
    var count = $(this).val().length;
    var countJar = $('#entry-word-count');
    if(count <= 475 && countJar.hasClass('warn')) countJar.removeClass('warn');
    else if(count > 475 && count <= 500) countJar.addClass('warn');
    else if(count > 500) $(this).val($(this).val().substring(0,500));
    countJar.text(count);
  });

});