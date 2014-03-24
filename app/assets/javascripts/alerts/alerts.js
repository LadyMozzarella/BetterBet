var Alert = {};

Alert.View = function(selectors) {
  this.selectors = selectors;
}

Alert.View.prototype = {
  renderGoals: function(goals) {
    alert(goals);
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
      datatype: 'json',
      context: this
    }).success(function(response) {
      if (response.length > 0) {
        this.view.renderGoals(response);
      }
    }).fail(function(xhr){
      console.log(xhr.responseText);
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
  }
};

$(document).ready(function() {
	if (window.location.pathname === '/dashboard'){
    var selectors = {};

    Alert.view = new Alert.View(selectors);
    Alert.controller = new Alert.Controller(Alert.view);
    new Alert.Binder(Alert.controller, selectors).bind();
	}
});

