Search.Controller = function(selectors){
  this.selectors = selectors
}

Search.Controller.prototype = {
  completeTerm: function(searchTerm){
    $.ajax({
      url: '/users/autocomplete',
      type: 'GET',
      context: this,
      data: {name: searchTerm}
    }).done(function(response){
      console.log(response)
      var results = []
      for (var i = 0; i < response.length; i++){
        results[i] = {
          "label": response[i].name,
          "value": response[i].id
        }
      }
      this.findResults(results);
    }).fail(function(xhr){
      $(this.selectors.search_form).append(xhr.responseText);
    });
  },

  findResults: function(results){
    $(this.selectors.search).autocomplete({
      source: results,
      select: function(event, ui) {
        var url = ui.item.value;
        if(url != '#') {
          location.href = '/users/' + url
        }
      }
    }
  )}

}