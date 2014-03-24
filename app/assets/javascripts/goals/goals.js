$(document).ready(function(){
  var selectors = {
    deleteGoal: '.goal_delete-button',
    editGoal: '.goal_edit-button'
  }
  Goals.view = new Goals.View(selectors);
  Goals.controller = new Goals.Controller(Goals.view);
  Goals.binder = new Goals.Binder(Goals.controller, selectors);
  Goals.binder.bindEvents();
})