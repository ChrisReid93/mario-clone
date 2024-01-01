extends Node2D


# Start the game when pressing "Play" and quit when pressing "Quit". ALso play background music on ready.
func _ready():
	MusicController.play_main_menu_music()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level1.tscn")


func _on_quit_pressed():
	get_tree().quit()
