extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Use "@onready" for AnimationPlayer to enable get_node
@onready var anim = $AnimationPlayer
var can_crouch
var can_jump

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		can_crouch = false
		$CoyoteTimer.start()

	# Handle crouch.
	if Input.is_action_pressed("crouch") and can_crouch == true:
		crouch()

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("Jump")
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flip animation depending on direction
	if direction == -1:
		$AnimatedSprite2D.flip_h = true
		can_crouch = false
	elif direction == 1:
		$AnimatedSprite2D.flip_h = false
		can_crouch = false
	elif direction == 0:
		can_crouch = true
	
	# If player is moving in X direction, move in direction at constant SPEED and play "Run" animation
	if direction:
		velocity.x = direction * SPEED
		# Play run animation if player on ground
		if velocity.y == 0:
			anim.play("Run")

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		# Check if player is on ground. If so, play "Idle" animation.
		if velocity.y == 0 and not Input.is_action_pressed("crouch"):
			anim.play("Idle")

	move_and_slide()

# Create crouch function
func crouch():
	anim.play("Crouch")


func _on_coyote_timer_timeout():
	pass # Replace with function body.
