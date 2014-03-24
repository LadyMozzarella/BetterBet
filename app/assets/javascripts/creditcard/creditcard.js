$(document).ready(function() {

  CreditCard.view = new CreditCard.View;
  CreditCard.controller = new CreditCard.Controller(CreditCard.view);
  new CreditCard.Binder(CreditCard.controller).bind();
});
