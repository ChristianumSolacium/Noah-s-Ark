extends Area2D
@export var pos0 : CollisionShape2D
@export var pos1 : CollisionShape2D
@export var camera_corner : Node2D

func _process(delta: float) -> void:
	pass
	for body in get_overlapping_bodies():
		if body.material is ShaderMaterial:
			body.sprite.material.set_shader_parameter("pos0", - camera_corner.global_position + pos0.global_position)
			body.sprite.material.set_shader_parameter("pos1", - camera_corner.global_position + pos1.global_position)
			body.sprite.material.set_shader_parameter("active",true)



func _on_body_exited(body: Node2D) -> void:
	if body.material is ShaderMaterial:
		body.sprite.material.set_shader_parameter("active",false)
