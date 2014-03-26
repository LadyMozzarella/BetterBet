$(document).ready(function(){
  var selectors = {
    search: '#search',
    form: '.search_friends',
    uiHelper: '.ui-helper-hidden-accessible'
  }
  BetterBet.Search.controller = new BetterBet.Search.Controller(selectors);
  new BetterBet.Search.Binder(BetterBet.Search.controller, selectors).bindEvents();
})


