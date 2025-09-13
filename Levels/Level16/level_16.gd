extends Node2D

@onready var spike: Spike = $Spike
@onready var spike_3: Spike = $Spike3
@onready var ray_cast_1: RayCast2D = $Spike/RayCast1
@onready var ray_cast_2: RayCast2D = $RayCast2
@onready var ray_cast_3: RayCast2D = $Spike3/RayCast3
@onready var tile_map_layer_2: TileMapLayer = $TileMapLayer2

func _physics_process(_delta: float) -> void:
	if ray_cast_1.is_colliding():
		ray_cast_1.collision_mask = 0
		spike.change_pos()

	elif ray_cast_2.is_colliding():
		ray_cast_2.collision_mask = 0

		var tween: Tween = create_tween()
		tween.tween_property(tile_map_layer_2, "global_position:x", 126.0, 1.0)

	elif ray_cast_3.is_colliding():
		ray_cast_3.collision_mask = 0
		spike_3.change_pos()

func _on_gate_changed_pos() -> void:
	await get_tree().create_timer(3.0).timeout
	var tween: Tween = create_tween()
	tween.tween_property(tile_map_layer_2, "global_position:x", 0.0, 1.0)
	ray_cast_3.collision_mask = 2


func _on_gate_win() -> void:
	get_tree().change_scene_to_file("res://Levels/Level17/level_17.tscn")
