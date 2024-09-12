@tool
extends TileMapLayer
class_name Chunk

## permette di generare casualmente il terreno, il background o il foreground,
## utilizzando i tiles indicati in ChunkTilesContainer, tramite il metodo
## get_random_tile() (i tiles sono rappresentati dai loro id nel tileset)

@export var width: int = 40
@export var height: int = 24


@export var chunk_tiles: ChunkTilesContainer:
	set(value):
		chunk_tiles = value
		chunk_tiles.tile_set = tile_set


@export_category("Debug")
@export var test_generate: bool:
	set(_value):
		
		generate()


@export var clear_chunk: bool:
	set(_value):
		if not _value:
			return
		
		clear()


func generate() -> void:
	for x in width:
		for y in height:
			set_cell(Vector2i(x,y),chunk_tiles.get_random_tile(),Vector2i(0,0))
