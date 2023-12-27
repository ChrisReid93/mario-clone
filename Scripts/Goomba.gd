extends CharacterBody2D

# Move enemy constantly to left
const SPEED = -75.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Setup animation variable
@onready var anim = $AnimationPlayer

func _physics_process(delta):
	# Gravity for Goomba
	velocity.y += gravity * delta
	# Check if animation is not "Death". If so, play "Walk" animation.
	if anim.current_animation != "Death":
		anim.play("Walk")
	# Have Goomba constantly move to the left
	velocity.x = SPEED
	
	move_and_slide()
	
	
# Create a function to check if enemy jumped on. If so, confirm that the name of the "body" variable is "Player" and kill enemy if so.
func _on_player_stomp_body_entered(body):
	if body.name == "Player":
		death()

func _on_player_hit_body_entered(body):
	if body.name == "Player":
		Game.playerHP -= 1
		
		
# Create death function
# Stop Goomba movement, play death animation, wait until the animation is done, and delete (i.e. "queue_free") that enemy instance.
func death():
	velocity.x = 0
	anim.play("Death")
	await anim.animation_finished
	self.queue_free()



