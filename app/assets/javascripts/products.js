$(document).ready(function(){
  rowID = $('.remove_from_cart_button').attr('id');
  $('#add-to-cart').on('click', '.add_to_cart_button', StoreApp.addProductToCart);
  $('#remove-from-cart').on('click', '.remove_from_cart_button', StoreApp.removeProductToCart);
  $( "#asc-sort" ).click(StoreApp.sortAsc);
  $( "#desc-sort" ).click(StoreApp.sortDesc);
  $( "#rating-sort" ).click(StoreApp.sortRating);
  $('#order-total').currency();
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
  var product_id = $('#product-model').attr('data-id'),
      order_product_id = 'product_' + order_product_row,
      list_item = $('<li>', {
        'class':'list-group-item',
        'id':order_product_id,
        'style':'display:block;'
        }),
      list_item_brand = $('#product-brand').text(),
      list_item_model = $('#product-model').text(),
      list_item_price = $('#product-price').text(),
      list_item_url = '/products/' + product_id,
      list_item_link = '<a href=' + list_item_url + '>' + list_item_brand + ' ' + list_item_model + '</a>',
      added_to_cart = list_item.html('<strong>' + list_item_link + '</strong><br/>' + list_item_price);
  return added_to_cart;
};

StoreApp.addProductToCart = function() {
  var product_id = $('#product-model').attr('data-id'),
      quantity = 1;
  $('.add_to_cart_button').toggle();
  $('.remove_from_cart_button').toggle();
  $.ajax({
    url: '/orders',
    type: 'POST',
    data: {order: {product_id: product_id, quantity: quantity}}
  })
  .done(function(result) {
    var myInteger;
    rowID = result[result.length -1]['id'];
    $('#cart-preview').append(StoreApp.cartPreviewItem(rowID));
    myInteger = parseInt($('.badge').text()) + 1;
    $('.badge').text(myInteger);
    $('#empty-cart').hide('slow');
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
  var myInteger;
  $('.add_to_cart_button').toggle();
  $('.remove_from_cart_button').toggle();
  $.ajax({
    url: '/order_products/' + rowID,
    type: 'DELETE'
  })
  .done(function(result) {
    var product_removed = "#product_" + rowID;
    $(product_removed).hide('slow');
    $('#empty-cart').show('slow');
    console.log("success");
  })
  .fail(function() {
    console.log("error");
  })
  .always(function() {
    console.log("complete");
  });
  myInteger = parseInt($('.badge').text()) - 1;
  $('.badge').text(myInteger);
};

StoreApp.sortAsc = function() {
  var myArray = $("#products-catalogue .summary");
  var count = 0;
  myArray.sort(function (a, b) {
    a = parseInt($(a).attr('data-price'), 10);
    b = parseInt($(b).attr('data-price'), 10);
    count += 2;
    if(a > b) {
      return 1;
    } else if(a < b) {
      return -1;
    } else {
      return 0;
    }
  });
  $("#products-catalogue").append(myArray);
};

StoreApp.sortDesc = function() {
  var myArray = $("#products-catalogue .summary");
  var count = 0;
  myArray.sort(function (a, b) {
    a = parseInt($(a).attr('data-price'), 10) * -1;
    b = parseInt($(b).attr('data-price'), 10) * -1;
    count += 2;
    if(a > b) {
      return 1;
    } else if(a < b) {
      return -1;
    } else {
      return 0;
    }
  });
  $("#products-catalogue").append(myArray);
};

StoreApp.sortRating = function() {
  var myArray = $("#products-catalogue .summary");
  var count = 0;
  myArray.sort(function (a, b) {
    a = parseFloat($(a).attr('data-rating'), 10) * -1;
    b = parseFloat($(b).attr('data-rating'), 10) * -1;
    count += 2;
    if(a > b) {
      return 1;
    } else if(a < b) {
      return -1;
    } else {
      return 0;
    }
  });
  $("#products-catalogue").append(myArray);
};
