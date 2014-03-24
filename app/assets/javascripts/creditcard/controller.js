CreditCard.Controller = function(view) {
  this.view = view;
}

CreditCard.Controller.prototype = {
  validate: function(form, number) {
    var valid = $.payment.validateCardNumber(number);
    if ( !valid ) {
      this.view.alertInvalid();
    } else {
      this.view.disableSubmit();
      Stripe.card.createToken(form, stripeResponseHandler);
    }
  },
  stripeResponseHandler: function(status, response) {
    var $form = $('form');

    if (response.error) {
      this.view.displayError(response.error.message);
      this.view.disableSubmit();
    } else {
      this.view.addStripeToken(response.id);
      this.view.submitForm();
    }
  }
};