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
    $(this.selectors.search).on("keydown", function(e){
      var searchTerm = $(this).val();
      controller.completeTerm(searchTerm);
    });
  },

  bindClick: function(){
    var controller = this.controller
    $('body').on("click", ".ui-menu-item a", function(e){
      var id = $(this).data("id")
      controller.searchTerm(id);
    })
  }
}