extends Area2D

@onready var anim = $AnimatedSprite2D


func _on_body_entered(body):
	if body.name == "Player":
		Game.score_timer.paused = true
		Game.score += int(Game.score_timer.time_left)
		anim.play("Win")
		await anim.animation_finished
		get_tree().change_scene_to_file("res://Scenes/win_screen.tscn")
