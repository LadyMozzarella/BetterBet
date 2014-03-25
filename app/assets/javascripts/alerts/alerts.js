var Alert = {};

Alert.View = function(selectors) {
  this.selectors = selectors;
}

Alert.View.prototype = {
  renderGoal: function(goal) {
    $(document).foundation();
    $(this.selectors.goal).append(goal.title);
    $(this.selectors.modal).foundation('reveal', 'open');
  }
};

Alert.Controller = function(view) {
  this.view = view;
}

Alert.Controller.prototype = {
  getStatus: function() {
    $.ajax({
      url: '/goals/status',
      type: 'POST',
      dataType: 'json',
      context: this
    }).success(function(response) {
      if (response) {
        this.goal = response[0];
        this.view.renderGoal(this.goal);
      }
    }).fail(function(xhr){
      console.log(xhr.responseText);
    })
  },
  updateStatus: function(complete) {
    $.ajax({
      url: '/goals/'+ this.goal.id +'/terminate',
      type: 'PUT',
      data: {complete: complete},
      context: this
    }).success(function(){
      console.log("I updated")
    }).fail(function(){
      console.log("I cannot find what you need")
    })
  }
};

Alert.Binder = function(controller, selectors) {
  this.controller = controller;
  this.selectors = selectors;
}

Alert.Binder.prototype = {
  bind: function() {
    this.controller.getStatus();
    this.bindGoalComplete();
  },
  bindGoalComplete: function() {
    $(this.selectors.buttonComplete).on('click', function(){
      this.controller.updateStatus(true);
    }.bind(this));
  }
};

$(document).ready(function() {
	if (window.location.pathname === '/dashboard') {
    var selectors = {
      modal: "#goal-alert",
      goal: '.goal',
      buttonComplete: '.goal-complete',
      buttonIncomplete: '.goal-incomplete',
    };

    Alert.view = new Alert.View(selectors);
    Alert.controller = new Alert.Controller(Alert.view);
    new Alert.Binder(Alert.controller, selectors).bind();
	}
});

