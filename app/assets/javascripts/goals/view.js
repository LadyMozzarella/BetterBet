BetterBet.Goals.View = function(selectors){
  this.selectors = selectors;
}

BetterBet.Goals.View.prototype = {
  removeGoal: function(goalId){
    $("div[data-id =" + goalId + "]").remove();
  },

  goalErrorAlert: function(xhr, goalId){
    $("div[data-id =" + goalId + "]").append(xhr.responseText);
  }
}