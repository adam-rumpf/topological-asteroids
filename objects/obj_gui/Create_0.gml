/// @desc Set default GUI element valules.

// Set lives depending on difficulty
switch global.difficulty
{
	// Free play
	case 0:
		lives = -1;
		break;
	
	// Normal
	case 1:
		lives = 3;
		break;
	
	// Hard
	case 2:
		lives = 1;
		break;
}

// Set current score to 0
score = 0;

// Figure out current room and difficulty
rid = 0; // room ID
did = global.difficulty - 1; // difficulty ID
switch room
{
	case rm_torus:
		rid = 0;
		break;
	
	case rm_klein:
		rid = 1;
		break;
	
	case rm_sphere:
		rid = 2;
		break;
	
	case rm_rpp:
		rid = 3;
		break;
	
	case rm_cylinder:
		rid = 4;
		break;
	
	case rm_mobius:
		rid = 5;
		break;
}

// Get best score from list
highest_score = global.high_scores[rid,did];
