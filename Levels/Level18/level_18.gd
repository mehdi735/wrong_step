extends Node2D


@onready var spike: Spike = $Spike
@onready var spike_2: Spike = $Spike2
@onready var ray_cast_1: RayCast2D = $Spike/RayCast1

func _physics_process(_delta: float) -> void:
	if ray_cast_1.is_colliding():
		ray_cast_1.collision_mask = 0
		spike.change_pos()


func _on_spike_finished() -> void:
	var tween: Tween = create_tween()
	tween.set_loops()
	tween.tween_property(spike_2, "global_position:x", spike_2.new_pos.x, 1.0)
	tween.tween_property(spike_2, "global_position:x", 0.0, 1.0)


func _on_gate_win() -> void:
	get_tree().change_scene_to_file("res://Levels/Level19/level_19.tscn")
