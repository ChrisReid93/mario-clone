extends Area2D

# Create constant showing beginning of file 
const FILE_BEGIN = "res://Scenes/level"


# Check if player contacts the flag. If so, get current scene name, convert it into an integer with "to_int" which removes all non-integers,
# change scene to next level, and queue_free current.
func _on_body_entered(body):
	if body.name == "Player":
		var current_scene_file = get_tree().current_scene.scene_file_path
		var next_level_number = current_scene_file.to_int() + 1
		
		# Concatenate the file path
		var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
		
		get_tree().change_scene_to_file(next_level_path)
