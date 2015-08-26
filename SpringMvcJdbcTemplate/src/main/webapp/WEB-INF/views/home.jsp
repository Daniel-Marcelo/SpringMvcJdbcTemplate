<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
               <meta charset="utf-8">
        <title>Creating a windows-like interface with jQuery UI</title>
        <!-- Load the jQuery UI CSS -->
        <link rel="stylesheet" href="resources/css/jquery-ui.min.css" type="text/css" />
         <link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
         <link rel="stylesheet" href="resources/css/jquery-ui.structure.css" type="text/css" />
         <link rel="stylesheet" href="resources/css/jquery-ui.theme.css" type="text/css" />
         <link rel="stylesheet" href="resources/css/jquery-ui.theme.min.css" type="text/css" />
        
         
        <!-- Load jQuery first before jQuery UI! -->
		<script src="resources/js/jquery.js"></script>
        <script src="resources/js/jquery-ui.min.js"></script>
        <script src="resources/js/jquery-ui.js"></script>
        
        <script>
var _init = $.ui.dialog.prototype._init;
$.ui.dialog.prototype._init = function() {
    //Run the original initialization code
    _init.apply(this, arguments);
     
    //set some variables for use later
    var dialog_element = this;
    var dialog_id = this.uiDialogTitlebar.next().attr('id');
     
    //append our minimize icon
    this.uiDialogTitlebar.append('<a href="#" id="' + dialog_id + 
    '-minbutton" class="ui-dialog-titlebar-minimize ui-corner-all">'+
    '<span class="ui-icon ui-icon-minusthick"></span></a>');
     
    //append our minimized state
    $('#dialog_window_minimized_container').append(
        '<div class="dialog_window_minimized ui-widget ui-state-default ui-corner-all" id="' + 
        dialog_id + '_minimized">' + this.uiDialogTitlebar.find('.ui-dialog-title').text() + 
        '<span class="ui-icon ui-icon-newwin"></div>');
     
    //create a hover event for the minimize button so that it looks good
    $('#' + dialog_id + '-minbutton').hover(function() {
        $(this).addClass('ui-state-hover');
    }, function() {
        $(this).removeClass('ui-state-hover');
    }).click(function() {
        //add a click event as well to do our "minimalization" of the window
        dialog_element.close();
        $('#' + dialog_id + '_minimized').show();
    });
     
    //create another click event that maximizes our minimized window
    $('#' + dialog_id + '_minimized').click(function() {
        $(this).hide();
        dialog_element.open();
    });
};
</script>
        
        
        
        <script>
        $(document).ready(function() {
            $("#create_button").button().click(function() {
                var create_dialog = $("#dialog_window_1");
                var create_button = $(this);
                 
                //if the window is already open, then close it and replace the label of the button
                if( create_dialog.dialog("isOpen") ) {
                    create_button.button("option", "label", "Create a new window");
                    create_dialog.dialog("close");
                } else {
                    //otherwise, open the window and replace the label again
                    create_button.button("option", "label", "Close window");
                    create_dialog.dialog("open");
                }
            });
             
            //open our dialog window, but set autoOpen to false so it doesn"t automatically open when initialized
            $("#dialog_window_1").dialog({
                width: "auto",
                height: "auto",
                autoOpen : false,
                buttons: [
                          {
                              text: 'Create',
                              click: function() {
                            	  
                            	  var x = document.getElementById("firstName").value;
                            	  alert(x);
                            	  /* 
                            	//get the total number of existing dialog windows plus one (1)
                            	  var div_count = $('.dialog_window').length + 1;
                            	   
                            	  //generate a unique id based on the total number
                            	  var div_id = 'dialog_window_' + div_count;
                            	   
                            	  //get the title of the new window from our form, as well as the content
                            	  var div_title = $('#new_window_title').val();
                            	  var div_content = $('#new_window_content').val();
                            	   
                            	  //generate a buttons array based on which ones of our checkboxes are checked
                            	  var buttons = new Array();
                            	  if( $('#alertbutton').is(':checked') ) {
                            	      buttons.push({
                            	          text: 'ALERT',
                            	          click: function() {
                            	              alert('ALERTING from Dialog Widnow: ' + div_title);
                            	          }
                            	      });
                            	  }
                            	   
                            	  if( $('#closebutton').is(':checked') ) {
                            	      buttons.push({
                            	          text: 'CLOSE',
                            	          click: function() {
                            	              $('#' + div_id).dialog('close');
                            	          }
                            	      });
                            	  }
                            	   
                            	  //append the dialog window HTML to the body
                            	  $('body').append('<div class="dialog_window" id="' + div_id + '">' + div_content + '</div>');
                            	   
                            	  //initialize our new dialog
                            	  var dialog = $('#' + div_id).dialog({
                            	      width: 'auto',
                            	      height: 'auto',
                            	      title : div_title,
                            	      autoOpen : true,
                            	      buttons: buttons
                            	  });                       */        }
                          }
                          ]
                      
            });
             
            //initialize our buttonset so our checkboxes are changed
            $("#buttonlist").buttonset();
        });

</script>




<style>
.dialog_form th {
    text-align: left;
}
 
.dialog_form textarea, .dialog_form input[type=text] {
    width: 320px;
}

#dialog_window_minimized_container {
    position: fixed;
    bottom: 0px;
    left: 0px;
}
 
.dialog_window_minimized {
    float: left;
    padding: 5px 10px;
    font-size: 12px;
    cursor: pointer;
    margin-right: 2px;
    display: none;
}
 
.dialog_window_minimized .ui-icon {
    display: inline-block !important;
    position: relative;
    top: 3px;
    cursor: pointer;
}
 
.ui-dialog .ui-dialog-titlebar-minimize {
    height: 18px;
    width: 19px;
    padding: 1px;
    position: absolute;
    right: 23px;
    top: 9px;
}
 
.ui-dialog .ui-dialog-titlebar-minimize .ui-icon {
    display: block;
    margin: 1px;
}
 
.ui-dialog .ui-dialog-titlebar-minimize:hover, .ui-dialog .ui-dialog-titlebar-minimize:focus {
    padding: 0;
}
</style>
    </head>
    <body>
    <div id="dialog_window_minimized_container"></div>
    <button id="create_button">Create a new window</button>
    
    
    <div id="dialog_window_1" class="dialog_window" title="This is our first dialog window">
<h3>Create a new <code>Dialog</code> Window</h3>
<table class="dialog_form">
    <tr>
        <th>window Title</th>
    </tr>
    <tr>
        <td><input type="text" id="new_window_title" /></td>
    </tr>
    <tr>
<form>
Ticker:<br>
<input type="text" id="firstname">
<br>
<button id="search_button">Search</button>
</form>
    </tr>
    <tr>
        <td>
            <textarea id="new_window_content"></textarea>
        </td>
    </tr>
    <tr>
        <th>
            window Buttons
        </th>
    </tr>
    <tr>
        <td id="buttonlist">
            <input type="checkbox" id="alertbutton" /><label for="alertbutton">ALERT</label>
            <input type="checkbox" id="closebutton" /><label for="closebutton">CLOSE</label>
<!--             <input type="checkbox" id="clonebutton" /><label for="clonebutton">CLONE</label>
 -->        </td>
    </tr>
</table>
</div>
    </body>
</html>
