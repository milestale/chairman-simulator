show_flyout = !show_flyout;
if (!position_meeting(mouse_x, mouse_y, self)) show_flyout = false;
if (show_flyout)
	{
		instance_activate_object(obj_gotosettings);
		instance_activate_object(obj_logout);
	
	}
else 
	{
		instance_deactivate_object(obj_gotosettings);
		instance_deactivate_object(obj_logout);
	
	}
