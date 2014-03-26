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
      if(response.goal !== null ){
        this.goal = response.goal;
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
<<<<<<< HEAD
    debugger
=======
>>>>>>> Add javascript for the buddy confirmation
    $.ajax({
      url: '/goals/'+ this.goal.id +'/confirm',
      type: 'PUT',
      data: {complete: complete},
      context: this
    }).success(function(){
      this.view.hideModal()
    }).fail(function(xhr){
      console.log(xhr.responseText)
    })
  }
};