/// @desc Reset room or return to menu after death.

if (lives > 0 || global.difficulty == 0)
	room_restart();
else
	scr_return_game();
