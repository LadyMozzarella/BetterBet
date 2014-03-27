BetterBet.BankAccount.View = function(selectors) {
  this.selectors = selectors;
}

BetterBet.BankAccount.View.prototype = {
  alertInvalid: function() {
    $(this.selectors.flashError).html('Bank account information is not valid.');
  },
  displayError: function(errorMsg) {
    $(this.selectors.flashError).html(errorMsg);
  },
  addStripeToken: function(token) {
    $(this.selectors.bankForm).append($(this.selectors.stripeInput).val(token));
  },
  submitForm: function() {
    $form = $(this.selectors.bankForm).off();
    $form.submit();
  }
};