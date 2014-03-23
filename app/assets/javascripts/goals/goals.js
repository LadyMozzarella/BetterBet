$(document).ready(function(){
  var Selectors = {
    deleteGoal: '.delete_goal'
  }
  Goals.view = new Goals.View(Selectors);
  Goals.controller = new Goals.Controller(Goals.view);
  Goals.binder = new Goals.Binder(Goals.controller, Selectors);
  Goals.binder.bindEvents();
})