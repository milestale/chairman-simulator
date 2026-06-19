// obj_controller - Step Event
if (global.score >= 10) {
    if (global.total_stools > 0)
		{
			global.total_stools = global.total_stools + 1;
			global.stools = global.stools + 1;
			global.cangetsand = 1;
			global.gotliquidglass = 0;
			global.gotsand = 0;
			global.cangetglass = 0;
			global.gotcauldron = 1;
			room_goto(mainroom);
		}
	else
		{
			global.total_stools = global.total_stools + 1;
			global.stools = global.stools + 1;
			global.cangetsand = 1;
			global.gotliquidglass = 0;
			global.gotsand = 0;
			global.cangetglass = 0;
			global.gotcauldron = 1;
			room_goto(ending);
		}

}