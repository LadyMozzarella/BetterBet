BankAccount.Controller = function(view, selectors){
  this.view = view;
  this.selectors = selectors;
}

BankAccount.Controller.prototype = {
  validate: function(routeNum, acctNum, country){
    var validRoute = Stripe.bankAccount.validateRoutingNumber(routeNum, country)
    var validAcct = Stripe.bankAccount.validateAccountNumber(acctNum, country)
    if (validRoute && validAcct) {
      Stripe.bankAccount.createToken({
        country: country,
        routingNumber: routeNum,
        accountNumber: acctNum,
      }, this.stripeResponseHandler.bind(this));
    } else{
      this.view.alertInvalid();
    }
  },

  stripeResponseHandler: function(status, response) {
    var $form = $(this.selectors.bankForm);
    if (response.error) {
      console.log('errorssssss')
      this.view.displayError(response.error.message);
    } else {
      console.log('got here')
      this.view.addStripeToken(response.id);
      this.view.submitForm();
    }
  }
}
