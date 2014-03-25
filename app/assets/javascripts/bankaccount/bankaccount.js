$(document).ready(function() {
  var selectors = {
    bankForm: '#bank_form',
    country: 'input.country',
    acctNum: 'input.account_number',
    routingNum: 'input.routing_number',
    stripeInput: '<input type="hidden" name="stripeToken" />'
  };

  BankAccount.view = new BankAccount.View(selectors);
  BankAccount.controller = new BankAccount.Controller(BankAccount.view, selectors);
  new BankAccount.Binder(BankAccount.controller, selectors).bindEvents();
});
