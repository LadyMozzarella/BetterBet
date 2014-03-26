$(document).ready(function() {
  if (window.location.pathname === '/dashboard') {
    var selectors = {
      modal: "#goal-alert",
      goal: '.goal-alert-msg',
      buttonComplete: '.goal-complete',
      buttonIncomplete: '.goal-incomplete',
    };

    BetterBet.Alert.view = new BetterBet.Alert.View(selectors);
    BetterBet.Alert.controller = new BetterBet.Alert.Controller(BetterBet.Alert.view);
    new BetterBet.Alert.Binder(BetterBet.Alert.controller, selectors).bind();
  }
});