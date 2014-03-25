Alert.Controller = function(view) {
  this.view = view;
}

Alert.Controller.prototype = {
  getStatus: function() {
    $.ajax({
      url: '/goals/status',
      type: 'POST',
      dataType: 'json',
      context: this
    }).success(function(response) {
      if (response.length > 0) {
        this.goal = response[0];
        this.view.showModal(this.goal);
      }
    }).fail(function(xhr){
      console.log(xhr.responseText);
    })
  },
  updateStatus: function(complete) {
    $.ajax({
      url: '/goals/'+ this.goal.id +'/terminate',
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