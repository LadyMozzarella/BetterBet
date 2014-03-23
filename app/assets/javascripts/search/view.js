Search.View = function(selectors){
  this.selectors = selectors;
}

Search.View.prototype = {
  showResults: function(results){
    $(this.selectors.search).autocomplete({
      source: results
    })
  }
}