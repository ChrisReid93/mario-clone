extends CanvasLayer

func _ready():
	MusicController.play_game_over_music()

func _on_button_pressed():
	MusicController.play_try_again_music()
	get_tree().change_scene_to_file("res://Scenes/level1.tscn")
