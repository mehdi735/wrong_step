extends Node2D

@onready var spike: Spike = $Spike
@onready var ray_cast: RayCast2D = $Spike/RayCast
@onready var spike_2: Spike = $Spike2
@onready var ray_cast_2: RayCast2D = $Spike2/RayCast2
@onready var ball: RigidBody2D = $Ball

func _physics_process(_delta: float) -> void:
	if ray_cast.is_colliding():
		ray_cast.collision_mask = 0
		spike.change_pos()
		ball.show()
		ball.gravity_scale = 2.0
		ball.collision_mask = 1 | 4
		ball.apply_central_impulse(Vector2(500, 200))

	if ray_cast_2.is_colliding():
		ray_cast_2.collision_mask = 0
		spike_2.change_pos()


func _on_gate_win() -> void:
	get_tree().change_scene_to_file("res://Levels/Level27/level_27.tscn")
