extends Node2D

@export var chunkA: Chunk
@export var chunkB: Chunk

@export var fgA: Chunk
@export var fgB: Chunk

@export var bgA : Chunk
@export var bgB: Chunk

## serve a cambiare il chunk del terreno, del bg e del fg. verranno aggiornati quando escono dallo schermo
func set_chunk_tiles(terrain_tiles:ChunkTilesContainer,foreground_tiles:ChunkTilesContainer,background_tiles:ChunkTilesContainer) -> void:
	chunkA.chunk_tiles = terrain_tiles 
	chunkB.chunk_tiles = terrain_tiles
	fgA.chunk_tiles = foreground_tiles
	fgB.chunk_tiles = foreground_tiles
	bgA.chunk_tiles = background_tiles
	bgB.chunk_tiles = background_tiles
