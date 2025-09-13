extends Node2D

@onready var nodes_pos: Node = $NodePos
@onready var stickman: Player = $Stickman

var spike_scene: PackedScene = Paths.spike

func _on_timer_timeout() -> void:
	var spike: Spike = spike_scene.instantiate()
	var node_pos: Node2D = nodes_pos.get_children().pick_random()

	node_pos.add_child(spike)

	spike.new_pos = Vector2(stickman.global_position.x + randi_range(50, 200), 856.0)
	spike.time_change_pos = 1.0
	spike.change_pos()


func _on_gate_win() -> void:
	get_tree().change_scene_to_file("res://Levels/Level12/level_12.tscn")
