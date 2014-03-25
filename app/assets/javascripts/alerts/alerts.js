var Alert = {};

Alert.View = function(selectors) {
  this.selectors = selectors;
}

Alert.View.prototype = {
  showModal: function(goal) {
    $(document).foundation();
    $(this.selectors.goal).html(goal.title);
    $(this.selectors.modal).foundation('reveal', 'open');
  },
  hideModal: function() {
    $(this.selectors.modal).foundation('reveal', 'close');
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
      if (response.length > 0) {
        this.goal = response[0];
        this.view.showModal(this.goal);
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
      this.view.hideModal()
    }).fail(function(xhr){
      console.log(xhr.responseText)
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

