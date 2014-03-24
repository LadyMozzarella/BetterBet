Search.Controller = function(view){
  this.view = view
}

Search.Controller.prototype = {
  completeTerm: function(searchTerm){
    $.ajax({
      url: '/users/autocomplete',
      type: 'GET',
      context: this,
      data: {name: searchTerm}
    }).done(function(response){
      var results = []
      for (var i = 0; i < response.length; i++){
        results.push(response[i].name)
      }
      this.view.showResults(results)
      this.searchTerm(response)
    }).fail(function(xhr){
      this.view.showError(xhr);
    });
  },

  searchTerm: function(response){
    var id = response[0].id
    window.location.href = "/users/" + id
  },

}