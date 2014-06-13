var StoreApp = StoreApp || {};

StoreApp.collapseCart = function() {
  $('#cart-icon').removeClass("fa-chevron-down").addClass("fa-chevron-up");
};

StoreApp.expandCart = function() {
  $('#cart-icon').removeClass("fa-chevron-up").addClass("fa-chevron-down");
};

$(document).ready(function() {
  $('.collapse').collapse({ toggle: false });

  $('#cart-collapsible')
    .on('shown.bs.collapse', StoreApp.collapseCart)
    .on('hidden.bs.collapse', StoreApp.expandCart);

  if (parseInt($('.badge').text()) !== 0){
    $('#empty-cart').hide();
  }
});
