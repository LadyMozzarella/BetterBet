BetterBet.Search.Binder = function(controller, selectors){
  this.controller = controller;
  this.selectors = selectors;
}

BetterBet.Search.Binder.prototype = {

  bindEvents: function(){
    this.bindKeyup();
  },

  bindKeyup: function(){
    var controller = this.controller;
    $(this.selectors.search).on("keyup", function(e){
      var searchTerm = $(this).val();
      controller.completeTerm(searchTerm);
    })
  }
}