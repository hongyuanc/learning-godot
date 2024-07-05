extends Node

@onready var score = $Score

var scores = 0

func add_point():
	scores += 1
	score.text = "Coins: " + str(scores)
	
