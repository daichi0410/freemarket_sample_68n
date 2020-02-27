$(function() {
  $(document).on("ajax:success", ".fav", function(e) {
    if ($('#' + e.detail[0]).hasClass('fa-heart')) {
      $('#' + e.detail[0]).removeClass('fa-heart').addClass('fa-heart-o');
    } else {
  $('#' + e.detail[0]).removeClass('fa-heart-o').addClass('fa-heart');
    }
  })
})