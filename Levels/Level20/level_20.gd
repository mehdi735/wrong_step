extends Node2D

@onready var node_death: Node2D = $NodeDeath

var speed_rota: float = 1

func _process(delta: float) -> void:
	node_death.rotation += deg_to_rad(speed_rota * delta)
	speed_rota = clamp(speed_rota + delta, 1, 80)


func _on_gate_win() -> void:
	get_tree().change_scene_to_file("res://Levels/Level21/level_21.tscn")
