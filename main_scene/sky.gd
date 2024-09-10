@tool
extends Node2D

@export var day_color: Color
@export var nigh_sky_color: Color

@export var azimuth : float
@export var axis_ratio: float

@export var angular_speed: float = 0.1
@export var eye_speed : float = 0.01

@export_group("Nodes")
@export var sun: Sprite2D
@export var moon: Sprite2D 
@export var eye: Sprite2D 
@export var sky_background: ColorRect

@export_category("Debug")
@export var test_sky: bool:
	set(value):
		test_sky = value
		set_process(value)

var current_angle: float


func _ready() -> void:
	if Engine.is_editor_hint():
		set_process(false)
	current_angle = PI
	eye.scale = Vector2.ONE * 0.1


## TEMP tutto provvisorio
func _process(delta:float) -> void:
	current_angle += angular_speed * delta
	
	sky_background.color = day_color + (nigh_sky_color - day_color) * (sin(current_angle) +1)/2
	if current_angle > 2*PI:
		current_angle -= 2 * PI
	sun.position = Vector2(
	- azimuth / axis_ratio * cos(current_angle),
	azimuth * sin(current_angle)
	)
	moon.position = - sun.position
	eye.scale += Vector2.ONE * (delta * eye_speed) 
	
	
