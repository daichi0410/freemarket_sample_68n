// 高橋さんに聞く
window.addEventListener("load", function(){
  $(function(){
  $('.btn__left').click( function(){
    var target = $(this).data('target');
    $('#' + target ).slideToggle();
    });
  });
});