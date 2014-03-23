$(document).ready(function(){
  Friends.view = new Friends.View()
  Friends.controller = new Friends.Controller(Friends.view)
  Friends.binder = new Friends.Binder(Friends.controller, Friends.Selectors)
  Friends.binder.bindEvents()
})