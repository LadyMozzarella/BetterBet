$(document).ready(function() {
  var selectors = {
    ccForm: '.new_user',
    ccNum: 'input.cc-num',
    ccExp: 'input.cc-exp',
    ccCVC: 'input.cc-cvc',
    errorsContainer: '.errors',
    stripeInput: '<input type="hidden" name="stripeToken" />'
  };

  BetterBet.CreditCard.view = new BetterBet.CreditCard.View(selectors);
  BetterBet.CreditCard.controller = new BetterBet.CreditCard.Controller(BetterBet.CreditCard.view, selectors);
  new BetterBet.CreditCard.Binder(BetterBet.CreditCard.controller, selectors).bind();
});
