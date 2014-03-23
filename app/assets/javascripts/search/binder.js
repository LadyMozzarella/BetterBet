var Search = {};

Search.Binder = function(controller, selectors){
  this.controller = controller;
  this.selectors = selectors;
}

Search.Binder.prototype = {
  bindKeydown: function(){
    var controller = this.controller;
    $(this.selectors.search).on("keydown", function(e){
      var searchTerm = $(this).val();
      controller.autoSearch(searchTerm);
    });
  }
}