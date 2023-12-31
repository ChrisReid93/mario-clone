extends Node2D


# Start the game when pressing "Play"
func _ready():
	MusicController.play_main_menu_music()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level1.tscn")


func _on_quit_pressed():
	get_tree().quit()
