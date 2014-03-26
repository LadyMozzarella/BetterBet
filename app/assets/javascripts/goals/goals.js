$(document).ready(function(){
  var selectors = {
    deleteGoal: '.goal_delete-button',
    editGoal: '.goal_edit-button'
  }
  BetterBet.Goals.view = new BetterBet.Goals.View(selectors);
  BetterBet.Goals.controller = new BetterBet.Goals.Controller(BetterBet.Goals.view);
  new BetterBet.Goals.Binder(BetterBet.Goals.controller, selectors).bindEvents();
})