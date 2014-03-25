BankAccount.View = function(selectors) {
  this.selectors = selectors;
}

BankAccount.View.prototype = {
  alertInvalid: function() {
    alert('Bank account information is not valid.');
    return false;
  },
  displayError: function(errorMsg) {
    $(this.selectors.bankForm).append(errorMsg);
  },
  addStripeToken: function(token) {
    $(this.selectors.bankForm).append($(this.selectors.stripeInput).val(token));
  },
  submitForm: function() {
    $form = $(this.selectors.bankForm).off();
    console.log('about to submit!')
    $form.submit();
  }
};