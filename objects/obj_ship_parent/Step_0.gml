/// @desc Listen for ship interactions.

//### Test code to check whether child ID list works.
if (keyboard_check_pressed(ord("C")))
{
	//### We would also play a single destruction sound at this time.
	for (var i = 0; i < global.cell_num; i++)
	{
		for (var j = 0; j < global.cell_num; j++)
			instance_destroy(ships[i,j]);
	}
}
