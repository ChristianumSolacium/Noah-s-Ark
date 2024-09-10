@tool
extends Resource
class_name ChunkTilesContainer

@export_storage var tile_set: TileSet

@export var tiles: Array[int]:
	set(value):
		
		for tile in value:
			if not tile_set.has_source(tile):
				push_error("il tile_set non ha un tile associato all'id scelto")
				return
		
		tiles = value
		
		if len(tile_rarity) != len(tiles):
			tile_rarity.resize(len(tiles))
			notify_property_list_changed()


@export var tile_rarity: Array[float]:
	set(array):
		if len(array) != len(tiles):
			return
		
		for val in array:
			if val < 0:
				return
		
		tile_rarity = array
		
		_set_cumulative_tile_rarity()
		notify_property_list_changed()


@export_storage var _sum_of_tile_rarities : float

@export var sum_of_tile_rarities : float:
	set(value):
		if value == _sum_of_tile_rarities:
			sum_of_tile_rarities = value 


@export var set_rarities_to_one: bool:
	set(value):
		var new_tile_rarity := tile_rarity
		for i in len(new_tile_rarity):
			new_tile_rarity[i] /= sum_of_tile_rarities
		
		tile_rarity = new_tile_rarity


var _cumulative_tile_rarity : Array[float] = [0]


func _set_cumulative_tile_rarity() -> void:
	if len(_cumulative_tile_rarity) != len(tile_rarity):
		_cumulative_tile_rarity.resize(len(tile_rarity))
	
	var total := 0.0
	
	for i in len(tile_rarity):
		total += tile_rarity[i]
		_cumulative_tile_rarity[i] = total
	
	_sum_of_tile_rarities = total
	sum_of_tile_rarities = total


func get_random_tile() -> int:
	var rand_value := randf_range(0,_sum_of_tile_rarities)
	
	for i in len(tiles):
		if _cumulative_tile_rarity[i] > rand_value:
			return tiles[i]
	return 0 
