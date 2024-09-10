extends CanvasLayer

##TODO define player class
@export var player : RigidBody2D

@export var progression_bar : TextureProgressBar

##TEMP
@export var end_of_world := 1800.0

func _ready() -> void:
	progression_bar.max_value = end_of_world

func _process(delta: float) -> void:
	progression_bar.value = player.position.x
