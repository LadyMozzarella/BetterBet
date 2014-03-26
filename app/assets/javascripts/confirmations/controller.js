Confirmation.Controller = function(view) {
  this.view = view;
}

Confirmation.Controller.prototype = {
  getStatus: function() {
    $.ajax({
      url: '/goals/buddy_status',
      type: 'POST',
      dataType: 'json',
      context: this
    }).success(function(response) {
<<<<<<< HEAD
      if(response.goal.length > 0 ){
        this.goal = response.goal[0];
        this.view.showModal(this.goal, response.friend);
=======
      debugger
      if(response.length > 0){
        this.goal = response.goal;
        this.view.showModal(this.goal);
>>>>>>> Add javascript for the buddy confirmation
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
<<<<<<< HEAD
    }).success(function(response){
      debugger
      this.view.hideModal()
    }).fail(function(xhr){
      console.log("I am getting fails")
=======
    }).success(function(){
      this.view.hideModal()
    }).fail(function(xhr){
      console.log(xhr.responseText)
>>>>>>> Add javascript for the buddy confirmation
    })
  }
};