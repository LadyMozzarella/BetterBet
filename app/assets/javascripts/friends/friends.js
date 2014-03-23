$(document).ready(function(){
  var Selectors = {
    addFriend: '.add_friend',
    deleteFriend: '.delete_friend',
    friendStatus: '.friend_status'
  }
  Friends.view = new Friends.View(Selectors);
  Friends.controller = new Friends.Controller(Friends.view);
  Friends.binder = new Friends.Binder(Friends.controller, Selectors);
  Friends.binder.bindEvents();
})