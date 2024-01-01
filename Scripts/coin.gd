extends Area2D

@onready var anim = $AnimatedSprite2D

# Create a function for what happens when the player picks up coins.
func _on_body_entered(body):
	if body.name == "Player":
		# Once player enters Coin area, disable that area to avoid double-counting if player leaves and re-enters area
		$CollisionShape2D.set_deferred("disabled", true)
		Game.score += 5
		$PickupCoinSound.play()
		# Create a tween for the apple. This will select "self" as the object to tween, "position" as the property, and shift it upwards by 30 pixels over 1 second.
		# Create a separate tween so they can run simultaneously.
		var tween1 = get_tree().create_tween()
		var tween2 = get_tree().create_tween()
		tween1.tween_property(self, "position", position - Vector2(0, 30), 0.3)
		tween2.tween_property(self, "modulate:a", 0, 0.3)
		tween1.tween_callback(queue_free)
		tween2.tween_callback(queue_free)
