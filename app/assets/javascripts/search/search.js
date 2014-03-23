$(document).ready(function(){
  var selectors = {
    search: '#search'
  }
  Search.view = new Search.View(selectors);
  Search.controller = new Search.Controller(Search.view);
  Search.binder = new Search.Binder(Search.controller, selectors);
  Search.binder.bindKeydown();
})


