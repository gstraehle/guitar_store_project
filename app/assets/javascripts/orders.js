$(document).ready(function(){
  $( ".remove_item" ).click(function() {
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
    }
  });
});
