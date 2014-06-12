$(document).ready(function(){
  $( ".remove-item" ).click(function() {
    var confirmation = confirm('Are you sure you want to remove this item?');
    if (confirmation == true) {
      $.ajax({
        url: '/order_products/' + this.id,
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
      var row_selector = "#" + this.id;
      $(row_selector).hide('slow');

      var product_removed = "#product_" + this.id;
      $(product_removed).hide('slow');
      var orderTotal = parseInt($('#order-total').text());
      var lostPrice= parseInt($(this).attr('data-price'));
      var myInteger = orderTotal - lostPrice;
      $('#order-total').text(myInteger);
    }
  });
});
