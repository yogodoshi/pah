// Console

if(typeof(console) == 'undefined') console = { log : function(){} };
if(typeof(console.log) != 'function') console.log = function(){};


// Functions

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


    /* Menu: Current Page */

    var current_page = location.pathname;

    $("#menu").each(function(i) {
      if (current_page.indexOf($(this).attr('href')) == 0) {
        $(this).addClass('current-page');
        return false
      }
    });


    /* Menu: Mobile */

    $("#menu-trigger").click(function() {
      $("#menu").toggle();
    });


    /* External Links */

    $("a[rel^='external']").each(function() {
      $(this).attr("target","_blank");
    });
    
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
      $(this).next().find('.hint').show();
		});
		$('input[type="text"], input[type="password"], textarea').blur(function() {
      $(this).next().find('.hint').hide();
		});
    
  }

} // Var Site

jQuery(function() {
	App.StartApp();
});
