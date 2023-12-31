extends Node

# Create global variables, including a Timer node for keeping score.

var playerHP = 3
var score = 0
var score_timer = Timer.new()

func _ready():
	add_child(score_timer)

