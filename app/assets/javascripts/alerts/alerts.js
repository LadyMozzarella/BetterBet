$(document).ready(function() {
  	if (window.location.pathname === '/dashboard'){
  		event.preventDefault();
  		// alert('hey');
  		$.ajax({
  			url: '/goals/status',
  			type: 'POST',
  			datatype: 'json'
  		}).success(function(response){
  			for (var i =0; i < response.length; i++) {
  				if ((response[i].end_date)){
  					console.log("JS date " + Date.now())
  					console.log("ruby date " + response[i].end_date)
  				}
  			};
  		}).fail(function(){
  			console.log('I do not exist');
  		})
  	}
  });


//   Alert.view = new Alert.View(selectors);
//   Alert.controller = new Alert.Controller(Alert.view, selectors);
//   new Alert.Binder(Alert.controller, selectors).bind();
// });

