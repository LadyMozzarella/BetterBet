$(document).ready(function() {
  var selectors = {
    bankForm: '#bank_form',
    country: 'input.country',
    acctNum: 'input.account_number',
    routingNum: 'input.routing_number',
    stripeInput: '<input type="hidden" name="stripeToken" />',
    flashError: '#flash-error'
  };

  BetterBet.BankAccount.view = new BetterBet.BankAccount.View(selectors);
  BetterBet.BankAccount.controller = new BetterBet.BankAccount.Controller(BetterBet.BankAccount.view, selectors);
  new BetterBet.BankAccount.Binder(BetterBet.BankAccount.controller, selectors).bindEvents();
});
