extends Node2D

@onready var fake_wall: Area2D = $FakeWall

func _on_fake_wall_body_entered(_body: Node2D) -> void:
	GlobalMusic.play_fx(Paths.trap)
	var tween: Tween = create_tween()
	tween.tween_property(fake_wall, "global_position:y", 1312.0, 0.5)


func _on_gate_1_win() -> void:
	get_tree().change_scene_to_packed(load("res://Levels/Level2/level_2.tscn"))
