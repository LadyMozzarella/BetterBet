Goals.Controller = function(view){
  this.view = view
}

Goals.Controller.prototype = {
  deleteGoal: function(goalId, userId){
    $.ajax({
      url: '/goals/' + userId,
      type: 'DELETE',
      context: this,
      data: {id: goalId}
    }).done(function(){
      this.view.removeGoal(goalId)
    }).fail(function(xhr){
      this.view.goalErrorAlert(xhr, goalId)
    });
  }

}