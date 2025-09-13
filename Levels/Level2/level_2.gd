extends Node2D

@onready var area_wall_1: Area2D = $AreaWall1
@onready var area_wall_2: Area2D = $AreaWall2

func _on_area_wall_1_body_entered(_body: Node2D) -> void:
	GlobalMusic.play_fx(Paths.trap)
	var tween: Tween = create_tween()
	tween.tween_property(area_wall_1, "global_position:y", 1290, 0.5)

func _on_area_wall_2_body_entered(_body: Node2D) -> void:
	GlobalMusic.play_fx(Paths.trap)
	var tween: Tween = create_tween()
	tween.tween_property(area_wall_2, "global_position:y", 1290, 0.5)


func _on_gate_win() -> void:
	get_tree().change_scene_to_packed(load("res://Levels/Level3/level_3.tscn"))
