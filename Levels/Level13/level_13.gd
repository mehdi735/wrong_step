extends Node2D

@onready var spike: Spike = $Spike
@onready var spike_2: Spike = $Spike2
@onready var spike_3: Spike = $Spike3
@onready var spike_4: Spike = $Spike4
@onready var spike_5: Spike = $Spike5
@onready var spike_6: Spike = $Spike6
@onready var gate: Gate = $Gate
@onready var ray_cast_1: RayCast2D = $Spike/RayCast1
@onready var stickman: Player = $Stickman

func _physics_process(_delta: float) -> void:
	if ray_cast_1.is_colliding():
		ray_cast_1.collision_mask = 0
		spike.change_pos()


func _on_spike_finished() -> void:
	spike_2.change_pos()

func _on_spike_2_finished() -> void:
	spike_3.change_pos()


func _on_spike_3_finished() -> void:
	spike_4.new_pos.x = stickman.global_position.x + 100
	spike_4.change_pos()


func _on_spike_4_finished() -> void:
	spike_5.new_pos.x = stickman.global_position.x - 50
	spike_5.change_pos()


func _on_spike_5_finished() -> void:
	gate.new_pos.x = (spike_4.global_position.x + spike_5.global_position.x) / 2


func _on_gate_changed_pos() -> void:
	spike_6.change_pos()


func _on_gate_win() -> void:
	get_tree().change_scene_to_file("res://Levels/Level14/level_14.tscn")
