$(document).ready(function(){
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

StoreApp.cartPreviewItem = function(order_product_row){
  var product_id = $('#product-model').attr('data-id');
  var order_product_id = 'product_' + order_product_row;
  var list_item = $('<li>', {
    'class':'list-group-item',
    'id':order_product_id,
    'style':'display:block;'
    });
  var list_item_brand = $('#product-brand').text();
  var list_item_model = $('#product-model').text();
  var list_item_price = $('#product-price').text();
  var list_item_url = '/products/' + product_id;
  var list_item_link = '<a href=' + list_item_url + '>' + list_item_brand + ' ' + list_item_model + '</a>';
  var added_to_cart = list_item.html('<strong>' + list_item_link + '</strong><br/>' + list_item_price);
  return added_to_cart;
};

StoreApp.addProductToCart = function() {
  var product_id = $('#product-model').attr('data-id');
  $('.add_to_cart_button').toggle();
  $('.remove_from_cart_button').toggle();
  $.ajax({
    url: '/orders',
    type: 'POST',
    data: {order: {product_id: product_id}}
  })
  .done(function(result) {
    RowID = result[result.length -1]['id'];
    $('#cart-preview').append(StoreApp.cartPreviewItem(RowID));
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
    var product_removed = "#product_" + RowID;
    $(product_removed).hide('slow');
  })
  .fail(function() {
    console.log("error");
  })
  .always(function() {
    console.log("complete");
  });

};
