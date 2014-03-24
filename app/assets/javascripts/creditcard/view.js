CreditCard.View = function(options) {
  // use logic on line 3 or 4.
  this.selectors = this.options.selectors || {
    ccForm: options.selectors.ccForm || '.new_user',
    ccNum: 'input.cc-num',
    ccExp: 'input.cc-exp',
    ccCVC: 'input.cc-cvc',
    errorsContainer: '.errors',
    stripeInput: '<input type="hidden" name="stripeToken" />'
  };;
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
    $form = $(this.selectors.ccForm).off();
    $form.submit();
  }
};
