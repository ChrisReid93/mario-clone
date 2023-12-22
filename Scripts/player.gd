extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const CHAR_WIDTH = 16

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Use "@onready" for AnimationPlayer to enable get_node
@onready var anim = $AnimationPlayer
var can_jump = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	# Prevent player from moving left off screen
	if position.x < CHAR_WIDTH:
		position.x = CHAR_WIDTH
		
	# Coyote Time setup. Check if player is on floor, and let them jump. If they fall (i.e. don't jump) then start CoyoteTime.
	if is_on_floor():
		can_jump = true
	# Keep restarting CoyoteTimer when player is on ground. Once player leaves ground and can_jump then start timer.
	elif can_jump == true and $CoyoteTimer.is_stopped():
		$CoyoteTimer.start()

	# Handle falling
	if not is_on_floor():
		if velocity.y > 0:
			anim.play("Fall")

	# Handle Jump.
	if can_jump == true:
		if Input.is_action_just_pressed("jump"):
			jump()
			
	# Create jump buffering.
	if can_jump == false:
		if Input.is_action_just_pressed("jump"):
			$JumpTimer.start()
	
	if can_jump == true and $JumpTimer.time_left > 0:
		jump()
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flip animation depending on direction
	if direction == -1:
		$AnimatedSprite2D.flip_h = true
	elif direction == 1:
		$AnimatedSprite2D.flip_h = false
	
	# If player is moving in X direction, move in direction at constant SPEED and play "Run" animation
	if direction:
		velocity.x = direction * SPEED
		# Play run animation if player on ground
		if velocity.y == 0:
			anim.play("Run")

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		# Check if player is on ground. If so, play "Idle" animation.
		if velocity.y == 0:
			anim.play("Idle")

	move_and_slide()

# Create jump function
func jump():
	velocity.y = JUMP_VELOCITY
	anim.play("Jump")
	can_jump = false


func _on_coyote_timer_timeout():
	can_jump = false
