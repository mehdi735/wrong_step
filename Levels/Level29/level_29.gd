extends Node2D

@onready var rigid_body_gate: RigidBody2D = $RigidBodyGate

func _on_rigid_body_gate_body_entered(_body: Node) -> void:
	GlobalMusic.play_fx(Paths.sound_jump)

func _on_rigid_body_gate_body_exited(_body: Node) -> void:
	rigid_body_gate.apply_central_impulse(Vector2(0, randi_range(-200, -300)))

func _on_gate_entered_gate() -> void:
	rigid_body_gate.body_exited.disconnect(_on_rigid_body_gate_body_exited)
	rigid_body_gate.gravity_scale = 0.0
	rigid_body_gate.linear_velocity = Vector2(0, 0)


func _on_stickman_death() -> void:
	rigid_body_gate.body_exited.disconnect(_on_rigid_body_gate_body_exited)
	rigid_body_gate.gravity_scale = 0.0
	rigid_body_gate.linear_velocity = Vector2(0, 0)


func _on_gate_win() -> void:
	get_tree().change_scene_to_file("res://Levels/Level30/level_30.tscn")
