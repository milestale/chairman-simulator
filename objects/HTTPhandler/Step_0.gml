if (global.issignup = 1)
{
	if (mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, signup))
{
var _url = "http://localhost:81/signup.php";
    
    var _post_data = "username=" + global.username + "&password=" + global.password;
    
    global.signup_request = http_post_string(_url, _post_data);
	
	show_debug_message("Send a request!");
}
}
if (global.issignup = 0)
{
	if (mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, signup))
	{
		var _url = "http://localhost:81/login.php";
    
		var _post_data = "username=" + global.username + "&password=" + global.password;
    
    // Send the request and store the HTTP ID
		global.login_request = http_post_string(_url, _post_data);
		
	}	
	
	
}
