BetterBet.Friends.View = function(selectors){
  this.selectors = selectors
}

BetterBet.Friends.View.prototype = {

  toggleFriendButton: function(text){
    $(this.selectors.friend).toggle();
    $(this.selectors.friendDiv).hide().html(text).fadeIn();
  },

  friendErrorAlert: function(xhr){
    $(this.selectors.friendStatus).html(xhr.responseText);
  },
}
