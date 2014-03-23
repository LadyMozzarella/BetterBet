$(document).ready(function(){
  var selectors = {
    addFriend: '.add_friend',
    deleteFriend: '.delete_friend',
    friendStatus: '.friend_status'
  }
  Friends.view = new Friends.View(selectors);
  Friends.controller = new Friends.Controller(Friends.view);
  Friends.binder = new Friends.Binder(Friends.controller, selectors);
  Friends.binder.bindEvents();
})