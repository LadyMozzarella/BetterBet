Goals.View = function(selectors){
  this.selectors = selectors
}

Goals.View.prototype = {
  removeGoal: function(goalId){
    $("." + goalId).remove()
  },

  goalErrorAlert: function(xhr, goalId){
    $("." + goalId).append(xhr.responseText)
  }
}