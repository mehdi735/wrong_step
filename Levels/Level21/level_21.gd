extends Node2D

@onready var name_level_body: RigidBody2D = $NameLevelBody
@onready var spike_rigid_body: RigidBody2D = $SpikeRigidBody
@onready var stickman: Player = $Stickman

func _ready() -> void:
	spike_rigid_body.apply_central_impulse((stickman.global_position - spike_rigid_body.global_position).normalized() * randi_range(500, 1000))

func _on_timer_rigid_body_timeout() -> void:
	GlobalMusic.play_fx(Paths.trap)
	name_level_body.apply_central_impulse((stickman.global_position - name_level_body.global_position).normalized() * randi_range(1000, 1500))


func _on_timer_speed_player_timeout() -> void:
	stickman.speed = randi_range(7000, 20000)

func _on_timer_jump_timeout() -> void:
	name_level_body.apply_central_impulse(Vector2(0, -200))
	spike_rigid_body.apply_central_impulse(Vector2(0, -200))


func _on_name_level_body_body_entered(_body: Node) -> void:
	name_level_body.apply_central_impulse(Vector2(0, -200))
	GlobalMusic.play_fx(Paths.sound_jump)


func _on_spike_rigid_body_body_entered(_body: Node) -> void:
	spike_rigid_body.apply_central_impulse(Vector2(0, -200))
	GlobalMusic.play_fx(Paths.sound_jump)


func _on_gate_changed_pos() -> void:
	var new_spike: RigidBody2D = spike_rigid_body.duplicate()
	call_deferred("add_child", new_spike)
	spike_rigid_body.apply_central_impulse((stickman.global_position - spike_rigid_body.global_position).normalized() * randi_range(500, 1000))

func _on_gate_win() -> void:
	get_tree().change_scene_to_file("res://Levels/Level22/level_22.tscn")
