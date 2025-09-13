extends Node2D

@onready var spike: Spike = $Spike
@onready var area_death: Area2D = $AreaDeath
@onready var ray_cast_1: RayCast2D = $Spike/RayCast1
@onready var ray_cast_2: RayCast2D = $AreaDeath/RayCast2

func _physics_process(_delta: float) -> void:
	if ray_cast_1.is_colliding():
		ray_cast_1.collision_mask = 0
		spike.change_pos()

	elif ray_cast_2.is_colliding():
		GlobalMusic.play_fx(Paths.trap)
		ray_cast_2.collision_mask = 0
		var tween: Tween = create_tween()
		tween.tween_property(area_death, "global_position:y", 1200.0, 0.5)

func _on_gate_changed_pos_array(index: int) -> void:
	if index == 4:
		ray_cast_2.collision_mask = 2


func _on_gate_win() -> void:
	get_tree().change_scene_to_packed(load("res://Levels/Level13/level_13.tscn"))
