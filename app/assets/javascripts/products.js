$(document).ready(function(){
  var product_id = $('#product-model').attr('data-id');
  RowID = $('.remove_from_cart_button').attr('id');
  $('#add-to-cart').on('click', '.add_to_cart_button', StoreApp.addProductToCart);
  $('#remove-from-cart').on('click', '.remove_from_cart_button', StoreApp.removeProductToCart);
  // $.ajax({
  //   url: '/orders',
  //   data: {order: {product_id: product_id}},
  //   dataType: 'json'
  // })
  // .done(function(result) {
  //   result = result[result.length -1];
  //   console.log(result);
  // });

  if($('.remove_from_cart_button').attr('id') === 'n/a'){
    $('.add_to_cart_button').show();
    $('.remove_from_cart_button').hide();
  } else{
    $('.add_to_cart_button').hide();
    $('.remove_from_cart_button').show();
  }

  });

var StoreApp = StoreApp || {};




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

// StoreApp.modify_qty = function(val) {
//   var qty = document.getElementById('quantity').value;
//   var new_qty = parseInt(qty,10) + val;
//   if (new_qty < 1) {
//     new_qty = 1;
//   }
//   document.getElementById('quantity').value = new_qty;
//   return new_qty;
// };

// StoreApp.bigfunction = function(){
//   // var product_id = <%= @product.id %>;
//   var next_order = <%= @next_order %>;

//   if (create_new_order_id === true) {
//     $.ajax({
//     url: 'http://localhost:3000/orders',
//     type: 'POST',
//     data: {order: {id: next_order, product_id: product_id }}
//   })
//   .done(function(response) {

//   });//end of first ajax post
//   create_new_order_id = false;//reseting variable to stop POSTing
//   }//end of if

//   if (use_put === false){
//     $.ajax({
//       url: 'http://localhost:3000/order_products',
//       type: 'POST',
//       data: {order_product: {product_id: product_id, quantity: cart_quantity, unit_price: unit_price, order_id: next_order}}
//     });//end of second ajax post
//     use_put = true;
//   } //end of 'if' part of second if;
//   else {
//     $.ajax({
//       url: 'http://localhost:3000/order_products/' + next_order,
//       type: 'PUT',
//       data: {order_product: {quantity: cart_quantity, product_id: product_id}}
//     });//end of second ajax post
//   }//end of 'else'
// };
