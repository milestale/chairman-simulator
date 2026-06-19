if (global.issignup = 1)
{
if (async_load[? "id"] == global.signup_request) {
    if (async_load[? "status"] == 0) {
        var _response_json = async_load[? "result"];
        
        // 1. PRINT THE RAW STRING TO THE CONSOLE
        show_debug_message("RAW SERVER RESPONSE: " + string(_response_json));
        
        // 2. USE TRY/CATCH TO PREVENT CRASHES
        try {
            var _data = json_parse(_response_json);
            
            if (_data.status == "success") {
                show_message_async("Success! Player ID: " + string(_data.player_id));
				global.player_id = _data.player_id;
				room_goto_next();
            } else {
                show_message_async("Failed: " + _data.message);
            }
        } catch (_exception) {
            // If the JSON is bad, the game won't crash. It will run this block instead.
            show_debug_message("JSON PARSE FAILED. Exception: " + _exception.message);
            show_message_async("Server error. Please try again later.");
        }
        
    } else if (async_load[? "status"] < 0) {
        show_message_async("Could not connect to the server.");
    }
}
}
else
{
// Check if this async event belongs to our login request
if (async_load[? "id"] == global.login_request) {
    
    if (async_load[? "status"] == 0) {
        var _response_json = async_load[? "result"];
        
        // Print raw response for debugging (useful if things break!)
        show_debug_message("RAW LOGIN RESPONSE: " + string(_response_json));
        
        try {
            var _data = json_parse(_response_json);
            
            if (_data.status == "success") {
                show_message_async("Welcome back, " + global.username + "!");
                
                // Extract the nested 'data' struct
                var _player_data = _data.data;
                
                // Save these to your global variables so the game can use them
                global.player_id = real(_player_data.player_id);
                global.player_bio = string(_player_data.bio);
                global.coins = real(_player_data.coins);
                global.stools = real(_player_data.stools);
                global.total_stools = real(_player_data.total_stools);
				room_goto_next();
                
            } else {
                // Wrong password or username
                show_message_async("Login Failed: " + _data.message);
            }
            
        } catch (_exception) {
            show_debug_message("JSON PARSE FAILED. Exception: " + _exception.message);
            show_message_async("Server error. Check the console.");
        }
        
    } else if (async_load[? "status"] < 0) {
        show_message_async("Could not connect to the server.");
    }
}
}