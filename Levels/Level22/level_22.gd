extends Node2D

@onready var gate_fake: RigidBody2D = $GateFake
@onready var gate_fake_2: RigidBody2D = $GateFake2
@onready var gate_fake_3: RigidBody2D = $GateFake3

func _on_gate_fake_body_entered(_body: Node) -> void:
	GlobalMusic.play_fx(Paths.sound_jump)
	gate_fake.apply_central_impulse(Vector2(200, 200))

func _on_gate_fake_2_body_entered(_body: Node) -> void:
	GlobalMusic.play_fx(Paths.sound_jump)
	gate_fake_2.apply_central_impulse(Vector2(-200, -200))


func _on_gate_fake_3_body_entered(_body: Node) -> void:
	GlobalMusic.play_fx(Paths.sound_jump)
	gate_fake_3.apply_central_impulse(Vector2(200, -200))


func _on_gate_win() -> void:
	get_tree().change_scene_to_file("res://Levels/Level23/level_23.tscn")
