extends Node2D

@onready var trap_name_label: Area2D = $TrapNameLabel
@onready var spinke: Spike = $Spinke
@onready var spinke_2: Spike = $Spinke2
@onready var ray_cast_1: RayCast2D = $TrapNameLabel/ray_cast_1
@onready var ray_cast_2: RayCast2D = $Spinke/RayCast2
@onready var ray_cast_3: RayCast2D = $Spinke2/RayCast3

var is_show_trap2: bool

func _physics_process(_delta: float) -> void:
	if ray_cast_1.is_colliding():
		ray_cast_1.collision_mask = 0
		GlobalMusic.play_fx(Paths.trap)
		var tween: Tween = create_tween()
		tween.tween_property(trap_name_label, "global_position:y", 740, 0.5)
		await get_tree().create_timer(1.0).timeout
		GlobalMusic.play_fx(Paths.trap)
		trap_name_label.hide()
		trap_name_label.collision_layer = 0

	elif ray_cast_2.is_colliding():
		spinke.change_pos()

	elif ray_cast_3.is_colliding() and is_show_trap2:
		spinke_2.change_pos()

func _on_gate_changed_pos() -> void:
	is_show_trap2 = true


func _on_gate_win() -> void:
	get_tree().change_scene_to_packed(load("res://Levels/Level7/level_7.tscn"))
