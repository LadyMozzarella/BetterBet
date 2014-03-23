$(document).ready(function(){
  var selectors = {
    deleteGoal: '.delete_goal',
    editGoal: '.edit_goal'
  }
  Goals.view = new Goals.View(selectors);
  Goals.controller = new Goals.Controller(Goals.view);
  Goals.binder = new Goals.Binder(Goals.controller, selectors);
  Goals.binder.bindEvents();
})