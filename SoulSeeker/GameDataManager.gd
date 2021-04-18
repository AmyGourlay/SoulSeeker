extends Node

var level_to_unlock = 1
var stars = 0
var trackStars = 0
#Keeps track of stars collected on each level
var levelStars = {
	1:{
		"stars_unlocked": 0
	},
	2:{
		"stars_unlocked": 0
	},
	3:{
		"stars_unlocked": 0
	},
	4:{
		"stars_unlocked": 0
	},
	5:{
		"stars_unlocked": 0
	},
	6:{
		"stars_unlocked": 0
	}
	
}

#Method to update the stars collected on a level
func updateStars():
	levelStars[level_to_unlock]["stars_unlocked"] += 1
	if stars < 3:
		stars += 1
	else:
		stars = 1

#Method to set stars for a level to zero if the player dies before completing it
func setStarsToZero():
	stars = 0
	levelStars[level_to_unlock]["stars_unlocked"] = 0

#Method to get stars
func getStars():
	return stars

#Method to unlock a level
func unlock():
	level_to_unlock += 1
	
#Method to get the level to be unlocked 
func getUnlock():
	return level_to_unlock

