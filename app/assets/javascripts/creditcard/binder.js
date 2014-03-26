BetterBet.CreditCard.Binder = function(controller, selectors) {
  this.controller = controller;
  this.selectors = selectors;
}

BetterBet.CreditCard.Binder.prototype = {
  bind: function() {
    $(this.selectors.ccNum).payment('formatCardNumber');
    $(this.selectors.ccExp).payment('formatCardExpiry');
    $(this.selectors.ccCVC).payment('formatCardCVC');
    this.bindSubmit();
  },
  bindSubmit: function() {
    var self = this;
    $(this.selectors.ccForm).on('submit', function(e) {
      e.preventDefault();
      self.controller.validate($(this), $(self.selectors.ccNum).val());
    });
  }
}