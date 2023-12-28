extends Area2D




# Check if player contacts 
func _on_body_entered(body):
	if body.name == "Player":
		var current_scene_file = get_tree().current_scene.scene_file_path
