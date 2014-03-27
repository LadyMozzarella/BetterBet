$(document).ready(function() {
  if (window.location.pathname === '/dashboard') {
    var selectors = {
      modal: "#goal-confirmation",
      goal: '.goal-confirmation-msg',
      buttonComplete: '.confirm-complete',
      buttonIncomplete: '.confirm-incomplete',
      buddyname: '.buddy-name',
      flashError: '#flash-error'
    };


    BetterBet.Confirmation.view = new BetterBet.Confirmation.View(selectors);
    BetterBet.Confirmation.controller = new BetterBet.Confirmation.Controller(BetterBet.Confirmation.view);
    new BetterBet.Confirmation.Binder(BetterBet.Confirmation.controller, selectors).bind();
  }
});
