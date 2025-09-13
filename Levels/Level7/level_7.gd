extends Node2D

@onready var tile_map_layer_2: TileMapLayer = $TileMapLayer2
@onready var ray_cast_2: RayCast2D = $Spinke2/RayCast2
@onready var spinke: Spike = $Spinke
@onready var spinke_2: Spike = $Spinke2
@onready var spinke_3: Spike = $Spinke3

func _physics_process(_delta: float) -> void:
	if is_instance_valid(spinke_2) and ray_cast_2.is_colliding():
		spinke.change_pos()
		spinke_2.change_pos()
		spinke_3.change_pos()


func _on_gate_changed_pos() -> void:
	await get_tree().create_timer(2.0).timeout
	spinke.queue_free()
	spinke_2.queue_free()
	spinke_3.queue_free()
	var tween: Tween = create_tween()
	tween.tween_property(tile_map_layer_2, "global_position:x", -1607.0, 8.0)

func _on_gate_win() -> void:
	get_tree().change_scene_to_packed(load("res://Levels/Level8/level_8.tscn"))
