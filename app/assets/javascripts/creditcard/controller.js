CreditCard.Controller = function(view) {
  this.view = view;
  this.selectors = view.selectors;
}

CreditCard.Controller.prototype = {
  validate: function(form, number) {
    // personal preference, I like this more.
    if ( !$.payment.validateCardNumber(number) ) {
      this.view.alertInvalid();
    } else {
      this.view.disableSubmit();
      Stripe.card.createToken(form, this.stripeResponseHandler.bind(this));
    }
  },
  stripeResponseHandler: function(status, response) {
    if (response.error) {
      this.view.displayError(response.error.message);
      this.view.disableSubmit();
    } else {
      this.view.addStripeToken(response.id);
      this.view.submitForm();
    }
  }
};
