Friends.View = function(){}

Friends.View.prototype = {

  updateFriendDiv: function(text){
    $('.friend_status').html(text)
  },

  friendErrorAlert: function(xhr){
    $('.friend_status').html(xhr.responseText)
  },
}
