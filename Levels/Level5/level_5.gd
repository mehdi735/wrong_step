extends Node2D

@onready var ray_cast_1: RayCast2D = $Spinke/RayCast1
@onready var ray_cast_2: RayCast2D = $Spinke2/RayCast2
@onready var spinke: Spike = $Spinke
@onready var spinke_2: Spike = $Spinke2

func _physics_process(_delta: float) -> void:
	if ray_cast_1.is_colliding():
		spinke.change_pos()

	if ray_cast_2.is_colliding():
		spinke_2.change_pos()


func _on_gate_win() -> void:
	get_tree().change_scene_to_packed(load("res://Levels/Level6/level_6.tscn"))
