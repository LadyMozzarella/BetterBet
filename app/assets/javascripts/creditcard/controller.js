BetterBet.CreditCard.Controller = function(view, selectors) {
  this.view = view;
  this.selectors = selectors;
}

BetterBet.CreditCard.Controller.prototype = {
  validate: function(form, number) {
    var valid = $.payment.validateCardNumber(number);
    if ( !valid ) {
      this.view.alertInvalid();
    } else {
      this.view.disableSubmit();
      Stripe.card.createToken(form, this.stripeResponseHandler.bind(this));
    }
  },
  stripeResponseHandler: function(status, response) {
    var $form = $(this.selectors.ccForm);
    if (response.error) {
      this.view.displayError(response.error.message);
      this.view.disableSubmit();
    } else {
      this.view.addStripeToken(response.id);
      this.view.submitForm();
    }
  }
};