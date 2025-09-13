extends Node2D

@onready var tile_map_layer_2: TileMapLayer = $TileMapLayer2

func _on_trap_1_body_entered(_body: Node2D) -> void:
	GlobalMusic.play_fx(Paths.trap)
	var tween: Tween = create_tween()
	tween.tween_property(tile_map_layer_2, "global_position:x", -600, 0.5)


func _on_gate_win() -> void:
	get_tree().change_scene_to_packed(load("res://Levels/Level4/level_4.tscn"))
