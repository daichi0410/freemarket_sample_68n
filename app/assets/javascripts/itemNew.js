$(function(){
  function update_field(){
    var result = $('#input-price').val() * 0.1;
    $('#cmmission').text(result);
    var total_price = $('#input-price').val() - $('#input-price').val() * 0.1;
    $('#total').text(total_price);
  }
  $(function() {
    $('input').on('keyup change', function() {
      update_field();
    });
  });
});