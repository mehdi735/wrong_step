extends Node2D

@onready var spike: Spike = $Spike
@onready var spike_2: Spike = $Spike2
@onready var ray_cast_1: RayCast2D = $Spike/RayCast1
@onready var ray_cast_2: RayCast2D = $Spike2/RayCast2
@onready var ray_cast_3: RayCast2D = $RayCast3

func _physics_process(_delta: float) -> void:
	if ray_cast_1.is_colliding():
		ray_cast_1.collision_mask = 0
		spike.change_pos()
	elif ray_cast_2.is_colliding():
		ray_cast_2.collision_mask = 0
		spike_2.change_pos()

	elif ray_cast_3.is_colliding():
		ray_cast_3.collision_mask = 0
		spike.new_pos = Vector2(500, 840)
		spike_2.new_pos = Vector2(450, 840)

		spike.change_pos()
		spike_2.change_pos()

func _on_gate_changed_pos() -> void:
	ray_cast_3.collision_mask = 2

func _on_gate_win() -> void:
	get_tree().change_scene_to_file("res://Levels/Level11/leve_11.tscn")
