Confirmation.View = function(selectors) {
  this.selectors = selectors;
}

Confirmation.View.prototype = {
<<<<<<< HEAD
  showModal: function(goal, friend) {
    $(document).foundation();
    $('.buddy-name').append(friend)
=======
  showModal: function(goal) {
    $(document).foundation();
>>>>>>> Add javascript for the buddy confirmation
    $(this.selectors.goal).html(goal.title);
    $(this.selectors.modal).foundation('reveal', 'open');
  },
  hideModal: function() {
    $(this.selectors.modal).foundation('reveal', 'close');
  }
};