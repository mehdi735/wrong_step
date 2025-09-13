extends Node

var wave: int = 1
var high_score: int = Memory.get_data("game_manager", "high_score", 0)
var score: int:
	set(v):
		score = v
		if v > high_score:
			high_score = v
