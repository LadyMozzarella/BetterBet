var Search = {};

Search.Binder = function(controller, selectors){
  this.controller = controller;
  this.selectors = selectors;
}

Search.Binder.prototype = {

  bindEvents: function(){
    this.bindKeydown();
  },

  bindKeydown: function(){
    var controller = this.controller;
    $(this.selectors.search).on("keyup", function(e){
      var searchTerm = $(this).val();
      controller.completeTerm(searchTerm);
    });
  }
}