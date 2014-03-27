BetterBet.Confirmation.Controller = function(view) {
  this.view = view;
}

BetterBet.Confirmation.Controller.prototype = {
  getStatus: function() {
    $.ajax({
      url: '/goals/buddy_status',
      type: 'POST',
      dataType: 'json',
      context: this
    }).success(function(response) {
      if(response.goal.length > 0 ){
        this.goal = response.goal[0];
        this.view.showModal(this.goal, response.friend);
      }
    }).fail(function(xhr){
      console.log(xhr.responseText);
    })
  },
  updateStatus: function(complete) {
    $.ajax({
      url: '/goals/'+ this.goal.id +'/confirm',
      type: 'PUT',
      data: {complete: complete},
      context: this
    }).success(function(response){
      this.view.hideModal()
      if (response === 'false') {
        this.redirectToPayment(this.goal)
      };
    }).fail(function(xhr){
      console.log(xhr.responseText)
    })
  },
  redirectToPayment: function(goal) {
    $.ajax({
      url: '/goals/' + goal.id + '/charges',
      type: 'POST',
      data: {goal_id: goal.id},
      context: this
    }).success(function(){
        this.view.showTransfer();
    }).fail(function(xhr){
      console.log(xhr.responseText);
    })
  }
};