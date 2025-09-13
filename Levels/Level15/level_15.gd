extends Node2D

@onready var spikes: Array[Spike] = [$Spike, $Spike2, $Spike3, $Spike4]
@onready var spike_5: Spike = $Spike5
@onready var gate_fake: Gate = $GateFake
@onready var main_gate: Gate = $MainGate
@onready var ray_cast_1: RayCast2D = $RayCast1

func _physics_process(_delta: float) -> void:
	if ray_cast_1.is_colliding():
		ray_cast_1.collision_mask = 0

		for spike: Spike in spikes:
			spike.change_pos()


func _on_spike_4_finished() -> void:
	spike_5.change_pos()


func _on_gate_fake_finished() -> void:
	gate_fake.collision_layer = 4
	gate_fake.collision_mask = 0

	await get_tree().create_timer(7.0).timeout
	main_gate.change_pos(CharacterBody2D.new())


func _on_gate_fake_win() -> void:
	get_tree().change_scene_to_file("res://Levels/Level16/level_16.tscn")
