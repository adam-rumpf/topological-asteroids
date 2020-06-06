/// @desc Destroy self and bullets after time limit.

// Loop through all children to destroy them
if (room = rm_cylinder || room = rm_mobius)
{
	for (var j = 0; j < global.cell_num; j++)
		instance_destroy(bullets[1,j]);
}
else
{
	for (var i = 0; i < global.cell_num; i++)
	{
		for (var j = 0; j < global.cell_num; j++)
			instance_destroy(bullets[i,j]);
	}
}

// Then destroy self
instance_destroy();
