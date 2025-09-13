extends Node2D

@onready var tile_map_layer_2: TileMapLayer = $TileMapLayer2
@onready var tile_map_layer_3: TileMapLayer = $TileMapLayer3
@onready var ray_cast_1: RayCast2D = $RayCast1
@onready var gate: Gate = $Gate

var is_collision_ray_cast_1: bool


func _physics_process(_delta: float) -> void:
	if ray_cast_1.is_colliding() and !is_collision_ray_cast_1:
		var tween_1: Tween = create_tween()
		var tween_2: Tween = create_tween()

		tween_1.tween_property(tile_map_layer_2, "global_position:y", 400.0, 8.0)
		tween_2.tween_property(tile_map_layer_3, "global_position:y", 400.0, 8.0)

		tween_1.tween_property(tile_map_layer_2, "rotation", deg_to_rad(17.0),1.0)
		tween_2.tween_property(tile_map_layer_3, "rotation", deg_to_rad(17.0),1.0)

		tween_1.tween_property(tile_map_layer_2, "rotation", deg_to_rad(-20.0),1.0)
		tween_2.tween_property(tile_map_layer_3, "rotation", deg_to_rad(-20.0),1.0)

		tween_1.tween_property(tile_map_layer_2, "global_position:y", 800.0, 2.0)
		tween_2.tween_property(tile_map_layer_3, "global_position:y", 800.0, 2.0)

		tween_1.tween_property(tile_map_layer_2, "rotation", deg_to_rad(20.0),1.0)
		tween_2.tween_property(tile_map_layer_3, "rotation", deg_to_rad(20.0),1.0)

		is_collision_ray_cast_1 = true
		await get_tree().create_timer(7.0).timeout
		gate.change_pos(CharacterBody2D.new())
		await get_tree().create_timer(3.0).timeout
		gate.change_pos(CharacterBody2D.new())


func _on_gate_win() -> void:
	get_tree().change_scene_to_file("res://Levels/Level10/level_10.tscn")
