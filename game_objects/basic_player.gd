extends RigidBody2D

## TODO definisci le proprieta

@export var sprite : AnimatedSprite2D

func _physics_process(delta: float) -> void:
	linear_velocity = Vector2(
		Input.get_axis(&"move_left",&"move_right"),
		Input.get_axis(&"move_up",&"move_down")
	) * 300
	
	if abs(linear_velocity.x) > 0:
		sprite.flip_h = (linear_velocity.x < 0)
