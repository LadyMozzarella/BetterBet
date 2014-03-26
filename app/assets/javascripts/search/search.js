$(document).ready(function(){
  var selectors = {
    search: '#search',
    form: '.search_friends',
    uiHelper: '.ui-helper-hidden-accessible'
  }
  Search.controller = new Search.Controller(selectors);
  Search.binder = new Search.Binder(Search.controller, selectors);
  Search.binder.bindEvents();
})


