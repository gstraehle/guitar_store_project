$(document).ready(function(){
  var product_id = $('#product-model').attr('data-id');
  RowID = $('.remove_from_cart_button').attr('id');
  $('#add-to-cart').on('click', '.add_to_cart_button', StoreApp.addProductToCart);
  $('#remove-from-cart').on('click', '.remove_from_cart_button', StoreApp.removeProductToCart);

  if($('.remove_from_cart_button').attr('id') === 'n/a'){
    $('.add_to_cart_button').show();
    $('.remove_from_cart_button').hide();
    } else{
    $('.add_to_cart_button').hide();
    $('.remove_from_cart_button').show();
    }

    if($('#buttons').attr('data') === 'false'){
      $('#buttons').hide();
     }
  });

var StoreApp = StoreApp || {};


StoreApp.addProductToCart = function() {
  var product_id = $('#product-model').attr('data-id');
  var quantity = 1;
  $('.add_to_cart_button').toggle();
  $('.remove_from_cart_button').toggle();
  $.ajax({
    url: '/orders',
    type: 'POST',
    data: {order: {product_id: product_id, quantity: quantity}}
  })
  .done(function(result) {
    RowID = result[result.length -1]['id'];
    console.log("success");
  })
  .fail(function() {
    console.log("error");
  })
  .always(function() {
    console.log("complete");
  });
};

StoreApp.removeProductToCart = function() {

  $('.add_to_cart_button').toggle();
  $('.remove_from_cart_button').toggle();
  $.ajax({
    url: '/order_products/' + RowID,
    type: 'DELETE'
  })
  .done(function(result) {
    console.log("success");
  })
  .fail(function() {
    console.log("error");
  })
  .always(function() {
    console.log("complete");
  });

};
