// Console

if(typeof(console) == 'undefined') console = { log : function(){} };
if(typeof(console.log) != 'function') console.log = function(){};


// Functions

var App = {

  StartApp: function() {
      try {
        this.InterfaceActions();
      } catch (e) {
        alert('Existem erros no script.');
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
    
  }

} // Var Site

jQuery(function() {
	App.StartApp();
});
