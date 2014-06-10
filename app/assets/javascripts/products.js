$(document).ready(function(){
  // var use_put = <%= @use_put %>;
  // var create_new_order_id = <%= @create_new_order_id %>;

  $('#add-to-cart').on('click', '.add_to_cart_button', StoreApp.addProductToCart);
});//end of document ready


StoreApp = StoreApp || {}

StoreApp.modify_qty = function(val) {
  var qty = document.getElementById('quantity').value;
  var new_qty = parseInt(qty,10) + val;
  if (new_qty < 1) {
    new_qty = 1;
  }
  document.getElementById('quantity').value = new_qty;
  return new_qty;
};

StoreApp.addProductToCart = function() {
  $.ajax({
    url: '/orders',
    type: 'default GET (Other values: POST)',
    dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
    data: {param1: 'value1'},
  })
  .done(function() {
    console.log("success");
  })
  .fail(function() {
    console.log("error");
  })
  .always(function() {
    console.log("complete");
  });

};

StoreApp.bigfunction = function(){
  var product_id = <%= @product.id %>;
  var next_order = <%= @next_order %>;

  if (create_new_order_id === true) {
    $.ajax({
    url: 'http://localhost:3000/orders',
    type: 'POST',
    data: {order: {id: next_order, product_id: product_id }}
  })
  .done(function(response) {

  });//end of first ajax post
  create_new_order_id = false;//reseting variable to stop POSTing
  }//end of if

  if (use_put === false){
    $.ajax({
      url: 'http://localhost:3000/order_products',
      type: 'POST',
      data: {order_product: {product_id: product_id, quantity: cart_quantity, unit_price: unit_price, order_id: next_order}}
    });//end of second ajax post
    use_put = true;
  } //end of 'if' part of second if;
  else {
    $.ajax({
      url: 'http://localhost:3000/order_products/' + next_order,
      type: 'PUT',
      data: {order_product: {quantity: cart_quantity, product_id: product_id}}
    });//end of second ajax post
  }//end of 'else'
};
