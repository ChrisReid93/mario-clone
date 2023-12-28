extends Node2D

# Import mobs as packed scenes
@export var goomba_mob: PackedScene
@export var flyer_mob: PackedScene

# Create screen_size variable for access in all functions
@onready var screen_size = get_viewport_rect().size

# Create player position variable for use in other functions
var player_pos

# Spawn goombas when player enters area. Enemy must spawn beyond edge of screen and in line with player.
#func _on_goomba_spawner_body_entered(body):
#	# Mob should spawn just beyond edge of screen
#	print(screen_size)
#	player_pos = $Player.position
#
#
#	var goomba = goomba_mob.instantiate()
#
#
#	var goomba_spawn_location = Vector2(player_pos.x + 400, player_pos.y)
##	var goomba_spawn_location = player_pos + screen_size
#
#	goomba.position = goomba_spawn_location
#
#	add_child(goomba)
