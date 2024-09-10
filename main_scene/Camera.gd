extends Camera2D

##TODO define player class
@export var player : RigidBody2D

@export var foreground : Node2D

@export var background : Node2D

@export var foreground_speed : float = 2

@export var background_speed : float = 0


var _old_x : float
func _physics_process(delta: float) -> void:
	if player.position.x > position.x :
		position.x = player.position.x
		foreground.position.x -= foreground_speed * (position.x - _old_x)
		background.position.x -= background_speed * (position.x - _old_x)
		_old_x = position.x
