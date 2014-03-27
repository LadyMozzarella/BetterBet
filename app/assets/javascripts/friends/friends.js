$(document).ready(function(){
  var selectors = {
    addFriend: '.add_friend',
    deleteFriend: '.delete_friend',
    friend: '.friend',
    friendDiv: '.friend_status'
  }
  BetterBet.Friends.view = new BetterBet.Friends.View(selectors);
  BetterBet.Friends.controller = new BetterBet.Friends.Controller(BetterBet.Friends.view);
  new BetterBet.Friends.Binder(BetterBet.Friends.controller, selectors).bindEvents();
})