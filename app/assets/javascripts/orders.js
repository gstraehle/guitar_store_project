var StoreApp = StoreApp || {};

StoreApp.removeItem = function() {
  var confirmation = confirm('Are you sure you want to remove this item?'),
      row_selector,
      product_removed,
      orderTotal,
      lostPrice,
      newPrice,
      currency,
      myInteger;

  if (confirmation === true) {
    $.ajax({
      url: '/order_products/' + this.id,
      type: 'DELETE'
    })
    .done(function(result) {
      $('#empty-cart').show('slow');
      console.log("success");
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });

    row_selector = "#" + this.id;
    $(row_selector).hide('slow');
    product_removed = "#product_" + this.id;
    $(product_removed).hide('slow');

    currency = $('#order-total').text();
    orderTotal = Number(currency.replace(/[^0-9\.]+/g,""));
    lostPrice= parseInt($(this).attr('data-price'));
    newPrice = orderTotal - lostPrice;
    $('#order-total').text(newPrice);
    $('#order-total').currency();

    myInteger = parseInt($('.badge').text()) - 1;
    $('.badge').text(myInteger);
  }
};

$(document).ready(function(){
  $( ".remove-item" ).click(StoreApp.removeItem);
});
