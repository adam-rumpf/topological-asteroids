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

// Get best score from list
highest_score = -1;
switch room
{
	case rm_torus:
		if (global.difficulty == 1)
			best_score = global.high_scores[0,0];
		else if (global.difficulty == 2)
			best_score = global.high_scores[0,1];
		break;
	
	case rm_klein:
		if (global.difficulty == 1)
			best_score = global.high_scores[1,0];
		else if (global.difficulty == 2)
			best_score = global.high_scores[1,1];
		break;
	
	case rm_sphere:
		if (global.difficulty == 1)
			best_score = global.high_scores[2,0];
		else if (global.difficulty == 2)
			best_score = global.high_scores[2,1];
		break;
	
	case rm_rpp:
		if (global.difficulty == 1)
			best_score = global.high_scores[3,0];
		else if (global.difficulty == 2)
			best_score = global.high_scores[3,1];
		break;
	
	case rm_cylinder:
		if (global.difficulty == 1)
			best_score = global.high_scores[4,0];
		else if (global.difficulty == 2)
			best_score = global.high_scores[4,1];
		break;
	
	case rm_mobius:
		if (global.difficulty == 1)
			best_score = global.high_scores[5,0];
		else if (global.difficulty == 2)
			best_score = global.high_scores[5,1];
		break;
}
