CreditCard.View = function(selectors) {
  this.selectors = selectors;
}

CreditCard.View.prototype = {
  alertInvalid: function() {
    alert('Credit card number is not valid.');
    return false;
  },
  disableSubmit: function() {
    $(this.selectors.ccForm).find('button').prop('disabled', true);
  },
  displayError: function(errorMsg) {
    $(this.selectors.errorsContainer).text(errorMsg);
  },
  addStripeToken: function(token) {
    $(this.selectors.ccForm).append($(this.selectors.stripeInput).val(token));
  },
  submitForm: function() {
    $(this.selectors.ccForm).submit();
  }
};