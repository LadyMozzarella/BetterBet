var BankAccount = {};

BankAccount.Binder = function(controller, selectors) {
  this.controller = controller;
  this.selectors = selectors;
}

BankAccount.Binder.prototype = {
  bindEvents: function() {
    this.bindSubmit();
  },
  bindSubmit: function() {
    var self = this;
    $(this.selectors.bankForm).on('submit', function(e) {
      e.preventDefault();
      var sels = self.selectors
      self.controller.validate($(sels.routingNum).val(), $(sels.acctNum).val(), $(sels.country).val());
    });
  }
}