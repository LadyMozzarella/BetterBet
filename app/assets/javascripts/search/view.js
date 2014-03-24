Search.View = function(selectors){
  this.selectors = selectors;
}

Search.View.prototype = {
  showResults: function(results){
    $(this.selectors.search).autocomplete({
      source: results
    })
  },

  showError: function(xhr){
    $(this.selectors.search_form).append(xhr.responseText);
  }
}