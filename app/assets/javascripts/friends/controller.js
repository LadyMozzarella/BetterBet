Friends.Controller = function(view){
  this.view = view
}

Friends.Controller.prototype = {
  addFriend: function(friendId){
    $.ajax({
      url: '/friendships',
      type: 'POST',
      context: this,
      data: {friend_id: friendId}
    }).done(function(){
      this.view.updateFriendDiv("Added friend")
    }).fail(function(xhr){
      this.view.friendErrorAlert(xhr)
    })
  },

  deleteFriend: function(friendId, userId){
    $.ajax({
      url: '/friendships/' + userId,
      type: 'DELETE',
      context: this,
      data: {friend_id: friendId}
    }).done(function(){
      this.view.updateFriendDiv("Deleted friend")
    }).fail(function(xhr){
      this.view.friendErrorAlert()
    })
  }

}