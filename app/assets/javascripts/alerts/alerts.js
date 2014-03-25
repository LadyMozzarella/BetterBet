$(document).ready(function() {
	if (window.location.pathname === '/dashboard') {
    var selectors = {
      modal: "#goal-alert",
      goal: '.goal-alert-msg',
      buttonComplete: '.goal-complete',
      buttonIncomplete: '.goal-incomplete',
    };

    Alert.view = new Alert.View(selectors);
    Alert.controller = new Alert.Controller(Alert.view);
    new Alert.Binder(Alert.controller, selectors).bind();
	}
});