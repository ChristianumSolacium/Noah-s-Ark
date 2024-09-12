@tool
extends VisibleOnScreenNotifier2D

@export var chunk: Chunk


func _ready() -> void:
	if Engine.is_editor_hint():
		return
	
	
	set_process(false)
	position = Vector2((chunk.width) * chunk.tile_set.tile_size.x , 0)
	screen_exited.connect(_on_screen_exited)


func _process(delta: float) -> void:
	position = Vector2((chunk.width+1) * chunk.tile_set.tile_size.x , 0)


func _on_screen_exited() -> void:
	chunk.position.x += 2 * chunk.width * chunk.tile_set.tile_size.x
