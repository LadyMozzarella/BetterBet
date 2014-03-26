BetterBet.Friends.Binder = function(controller, selectors){
  this.controller = controller
  this.selectors = selectors
}

BetterBet.Friends.Binder.prototype = {

  bindEvents: function(){
    this.bindAddFriend();
    this.bindDeleteFriend();
  },

  bindAddFriend: function(){
    var controller = this.controller
    $(this.selectors.addFriend).on('click', function(e){
      e.preventDefault();
      var friendId = $(this).data('id')
      controller.addFriend(friendId);
    })
  },

  bindDeleteFriend: function(){
    var controller = this.controller
    $(this.selectors.deleteFriend).on('click', function(e){
      e.preventDefault();
      var friendId = $(this).data('friend')
      var userId = $(this).data('user')
      controller.deleteFriend(friendId, userId);
    })
  }

}