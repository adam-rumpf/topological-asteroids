/// @desc Room initialization code.

// Set symmetry value
switch room
{
	case rm_torus:
		symmetry = 0;
		break;
	case rm_klein:
		symmetry = 1;
		break;
}

//### Add an exception for the pause screen.
// Always reset camera to default
camera = 0;
//### Actually implement the view reset
