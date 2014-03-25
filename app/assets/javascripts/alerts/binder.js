var Alert = {};

Alert.Binder = function(controller, selectors) {
  this.controller = controller;
  this.selectors = selectors;
}

Alert.Binder.prototype = {
  bind: function() {
    this.controller.getStatus();
    this.bindGoalComplete();
    this.bindGoalIncomplete();
    this.bindGoalTerminate();
  },
  bindGoalComplete: function() {
    $(this.selectors.buttonComplete).on('click', function(){
      this.controller.updateStatus(true);
    }.bind(this));
  },
  bindGoalIncomplete: function() {
    $(this.selectors.buttonIncomplete).on('click', function(){
      this.controller.updateStatus(false);
    }.bind(this));
  },
  bindGoalTerminate: function() {
    $(document).on('closed', '[data-reveal]', function () {
      this.controller.getStatus();
    }.bind(this));
  }

};