$(document).ready(function() {
  var selectors = {
    ccform: 'form',
    ccNum: 'input.cc-num',
    ccExp: 'input.cc-exp',
    ccCVC: 'input.cc-cvc',
    errorsContainer: '.errors',
    stripeInput: '<input type="hidden" name="stripeToken" />'
  };

  CreditCard.view = new CreditCard.View(selectors);
  CreditCard.controller = new CreditCard.Controller(CreditCard.view);
  new CreditCard.Binder(CreditCard.controller, selectors).bind();
});
