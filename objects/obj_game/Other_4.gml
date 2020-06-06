/// @desc Room initialization code.

// Set symmetry value
switch room
{
	case rm_torus:
		global.symmetry = 0;
		break;
	case rm_klein:
		global.symmetry = 1;
		break;
	case rm_sphere:
		global.symmetry = 2;
		break;
	case rm_rpp:
		global.symmetry = 3;
		break;
	case rm_cylinder:
		global.symmetry = 4;
		break;
	case rm_mobius:
		global.symmetry = 5;
		break;
}

//### Add an exception for the pause screen.
// Always reset camera to default
camera = 0;
//### Actually implement the view reset
