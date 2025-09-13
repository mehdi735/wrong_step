extends Node2D

@onready var node_death: Node2D = $NodeDeath

var speed_rota: float = 1

func _physics_process(delta: float) -> void:
	node_death.rotation += deg_to_rad(speed_rota * delta)
	speed_rota += delta
