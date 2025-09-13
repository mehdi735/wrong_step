extends Node2D

@onready var key_trap_2: StaticBody2D = $KeyTrap2
@onready var trap_2: Area2D = $Trap2
@onready var ray_cast: RayCast2D = $RayCast
@onready var spinke: Spike = $Spinke
@onready var spinke_2: Spike = $Spinke2

func _physics_process(_delta: float) -> void:
	if ray_cast.is_colliding():
		ray_cast.collision_mask = 0
		spinke.change_pos()


func _on_trap_2_body_entered(_body: Node2D) -> void:
	GlobalMusic.play_fx(Paths.trap)
	var pos_y: float = trap_2.global_position.y
	var tween: Tween = create_tween()

	tween.tween_property(trap_2, "global_position:y", 1564.0,0.5)
	tween.tween_property(key_trap_2, "global_position:y", pos_y, 1.0)


func _on_gate_changed_pos() -> void:
	spinke_2.change_pos()


func _on_gate_win() -> void:
	get_tree().change_scene_to_packed(load("res://Levels/Level9/level_9.tscn"))
