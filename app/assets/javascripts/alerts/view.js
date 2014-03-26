BetterBet.Alert.View = function(selectors) {
  this.selectors = selectors;
}

BetterBet.Alert.View.prototype = {
  showModal: function(goal) {
    $(document).foundation();
    $(this.selectors.goal).html(goal.title);
    $(this.selectors.modal).foundation('reveal', 'open');
  },
  hideModal: function() {
    $(this.selectors.modal).foundation('reveal', 'close');
  }
};