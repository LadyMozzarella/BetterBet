Goals.View = function(selectors){
  this.selectors = selectors;
}

Goals.View.prototype = {
  removeGoal: function(goalId){
    $("div[data-id =" + goalId + "]").remove();
  },

  goalErrorAlert: function(xhr, goalId){
    $("div[data-id =" + goalId + "]").append(xhr.responseText);
  }
}