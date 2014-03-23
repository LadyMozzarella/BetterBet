Search.Controller = function(view){
  this.view = view
}

Search.Controller.prototype = {
  autoSearch: function(searchTerm){
    $.ajax({
      url: '/users/autocomplete',
      type: 'GET',
      context: this,
      data: {name: searchTerm}
    }).done(function(response){
      results = []
      for (var i = 0; i < response.length; i++){
        results.push(response[i].name)
      }
      this.view.showResults(results)
    }).fail(function(xhr){
      xhr.responseText;
    });
  }
}