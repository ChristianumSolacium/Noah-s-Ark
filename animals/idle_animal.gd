extends CharacterBody2D

const SPEED = 50.0
var move_direction = Vector2.ZERO
var move_time = 0.5  # 0.5 seconds moving
var stop_time = 1.5  # 1.5 seconds stopping
@export var timer = 0.0
var is_moving = true  # Toggle between moving and stopping 
var is_sprinting = false
enum Type { IDLE, FLEEING }

@export var animal_state = Type.IDLE

@onready var animated_sprite = $AnimatedSprite2D
@onready var detection_area = $Area2D

func _ready():
	randomize()  # Ensure random numbers are different every time
	if animal_state == Type.FLEEING:
		detection_area.connect("body_entered", Callable(self, "_on_area_2d_body_entered"))

func _physics_process(delta):
	timer -= delta
	
	if is_moving && !is_sprinting:
		# Move the character with velocity
		velocity = move_direction * SPEED
		
		# Flip the sprite if moving left or right
		if move_direction.x != 0:
			animated_sprite.flip_h = velocity.x < 0
		
		if timer <= 0:
			# Switch to stopping after moving
			is_moving = false
			timer = stop_time
			
	elif is_sprinting:
		move_direction = Vector2.RIGHT
		
	else:
		# Stop the character by setting velocity to zero
		velocity = Vector2.ZERO
		if timer <= 0:
			# Switch to moving after stopping
			is_moving = true
			timer = move_time
			move_direction = get_random_direction()
			
	# Move the character
	move_and_slide()

# Function to get a random Vector2 direction (Up, Down, Left, Right)
func get_random_direction() -> Vector2:
	var directions = [
		Vector2.UP,    # Up
		Vector2.DOWN,  # Down
		Vector2.LEFT,  # Left
		Vector2.RIGHT  # Right
	]
	return directions[randi() % directions.size()]  # Randomly pick one of the four directions

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D and body.name == "Player":
		# Only trigger sprinting when the player enters the area
		is_sprinting = true
