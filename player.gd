extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 130.0

func _physics_process(delta):
	var direction = Vector2(
		Input.get_axis(&"move_left",&"move_right"),
		Input.get_axis(&"move_up",&"move_down")
	)
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2(0,0)

	if abs(velocity.x) > 0:
		animated_sprite.flip_h = (velocity.x < 0)

	move_and_slide()
