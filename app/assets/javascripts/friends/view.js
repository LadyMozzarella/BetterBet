Friends.View = function(selectors){
  this.selectors = selectors
}

Friends.View.prototype = {

  toggleFriendButton: function(text){
    $(this.selectors.friend).toggle();
    $(this.selectors.friendDiv).html(text)
  },

  friendErrorAlert: function(xhr){
    $(this.selectors.friendStatus).html(xhr.responseText);
  },
}
