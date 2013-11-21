var App = {

  StartApp: function() {
      try {
        this.InterfaceActions();
        this.FormActions();
      } catch (e) {
        alert('Errors in the script');
        console.log('Error: ' + e);
      }
  },

  InterfaceActions: function() {

    
    
  },

  FormActions: function() {


    /* Form: Focus */

		$('input[type="text"], input[type="password"], textarea').focus(function() {
			$(this).css("box-shadow", "#ccc 0 0 5px");
		});
		$('input[type="text"], input[type="password"], textarea').blur(function() {
			$(this).css("box-shadow", "none");
		});

    
    /* Form: Hint */

		$('input[type="text"], input[type="password"], textarea').focus(function() {
      $(this).parent().find('.hint').show();
		});
		$('input[type="text"], input[type="password"], textarea').blur(function() {
      $(this).parent().find('.hint').hide();
		});

  }

} // Var Site

jQuery(function() {
	App.StartApp();
});
