extends Node2D

@onready var pos_spike: Node2D = $Stickman/PosSpike
@onready var pos_spike_2: Node2D = $PosSpike2
@onready var stickman: Player = $Stickman

var spike_scene: PackedScene = Paths.spike

func _on_timer_timeout() -> void:
	var spike: Spike = spike_scene.instantiate()
	spike.new_pos = Vector2(stickman.global_position.x + 50, 1000.0)
	pos_spike.add_child(spike)
	spike.change_pos()

	await spike.finished
	spike.queue_free()

	var spike_2: Spike = spike_scene.instantiate()
	spike_2.rotation = deg_to_rad(270.0)
	spike_2.new_pos = Vector2(56.0, pos_spike_2.global_position.y)
	pos_spike_2.add_child(spike_2)
	spike_2.change_pos()


func _on_gate_win() -> void:
	get_tree().change_scene_to_file("res://Levels/Level25/level_25.tscn")
