extends Node2D

@onready var ray_cast: RayCast2D = $RayCast
@onready var ray_cast_2: RayCast2D = $RayCast2
@onready var gate_fake: RigidBody2D = $GateFake
@onready var gate_fake_2: RigidBody2D = $GateFake2

func _physics_process(_delta: float) -> void:
	if ray_cast.is_colliding():
		ray_cast.collision_mask = 0
		gate_fake.apply_central_impulse(Vector2(-1000, -400))
		gate_fake.body_entered.connect(_on_gate_fake_body_entered)

	elif ray_cast_2.is_colliding():
		ray_cast_2.collision_mask = 0
		gate_fake_2.apply_central_impulse(Vector2(500, -200))
		gate_fake_2.body_entered.connect(_on_gate_fake_2_body_entered)



func _on_gate_fake_body_entered(_body: Node) -> void:
	GlobalMusic.play_fx(Paths.sound_jump)


func _on_gate_fake_2_body_entered(_body: Node) -> void:
	GlobalMusic.play_fx(Paths.sound_jump)


func _on_gate_win() -> void:
	get_tree().change_scene_to_file("res://Levels/Level24/level_24.tscn")
