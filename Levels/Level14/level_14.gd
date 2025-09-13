extends Node2D

@onready var tile_map_layer_2: TileMapLayer = $TileMapLayer2

var tween: Tween

func _ready() -> void:
	tween = create_tween()
	tween.set_loops(0)
	tween.tween_property(tile_map_layer_2, "rotation", deg_to_rad(-720), 10.0)
	tween.tween_property(tile_map_layer_2, "rotation", deg_to_rad(0), 2.0)



func _on_gate_changed_pos() -> void:
	tween.kill()
	await get_tree().create_timer(2.0).timeout
	var tween_2: Tween = create_tween()
	tween_2.tween_property(tile_map_layer_2, "rotation", deg_to_rad(360), 10.0)
	tween_2.tween_property(tile_map_layer_2, "rotation", deg_to_rad(0), 2.0)


func _on_gate_win() -> void:
	get_tree().change_scene_to_file("res://Levels/Level15/level_15.tscn")
