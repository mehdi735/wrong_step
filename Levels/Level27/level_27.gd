extends Node2D

@onready var spike: Spike = $Spike
@onready var spike_2: Spike = $Spike2
@onready var ray_cast: RayCast2D = $Spike/RayCast
@onready var ray_cast_2: RayCast2D = $RayCast2
@onready var stickman: Player = $Stickman

var index: int

func _physics_process(_delta: float) -> void:
	if ray_cast.is_colliding():
		ray_cast.collision_mask = 0
		spike.change_pos()

	elif ray_cast_2.is_colliding():
		ray_cast_2.collision_mask = 0
		spike.new_pos = Vector2(stickman.global_position.x - 100, 856)
		spike_2.new_pos = Vector2(stickman.global_position.x - 300, 856)
		spike.change_pos()
		spike_2.change_pos()

func _on_gate_changed_pos_array(_index: int) -> void:
	if index == 2:
		spike.new_pos = stickman.global_position
		spike_2.new_pos = stickman.global_position - Vector2(200, 0)
		spike.change_pos()
		spike_2.change_pos()
		ray_cast_2.collision_mask = 2

func _on_gate_finished() -> void:
	if index == 0:
		spike_2.change_pos()

	elif index == 1:
		spike.new_pos = spike_2.global_position
		spike_2.new_pos = spike.global_position
		spike.change_pos()
		spike_2.change_pos()

	index += 1


func _on_gate_win() -> void:
	get_tree().change_scene_to_file("res://Levels/Level28/level_28.tscn")
