extends Node2D

@onready var ray_cast_1: RayCast2D = $AreaDeath/RayCast1
@onready var area_death: Area2D = $AreaDeath
@onready var spike: Spike = $Spike

func _physics_process(_delta: float) -> void:
	if ray_cast_1.is_colliding():
		ray_cast_1.collision_mask = 0

		GlobalMusic.play_fx(Paths.trap)
		var tween: Tween = create_tween()
		tween.tween_property(area_death, "global_position:y", 800.0, 0.3)


func _on_gate_changed_pos() -> void:
	var tween: Tween = create_tween()
	tween.set_loops(0)
	tween.loop_finished.connect(_on_tween_loop_finished)
	tween.tween_property(spike, "global_position:x", 1500.0, 1.0)
	tween.tween_property(spike, "global_position:x", 97.0, 1.4)


func _on_tween_loop_finished(_loop_count: int) -> void:
	GlobalMusic.play_fx(Paths.trap)

func _on_gate_win() -> void:
	get_tree().change_scene_to_file("res://Levels/Level18/level_18.tscn")
