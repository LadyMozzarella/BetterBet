Friends.View = function(selectors){
  this.selectors = selectors
}

Friends.View.prototype = {

  updateFriendDiv: function(text){
    $(this.selectors.friendStatus).html(text);
  },

  friendErrorAlert: function(xhr){
    $(this.selectors.friendStatus).html(xhr.responseText);
  },
}
