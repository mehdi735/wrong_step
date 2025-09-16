extends Node2D

@onready var tile_death: RigidBody2D = $TileDeath
@onready var tile_death_2: RigidBody2D = $TileDeath2

func _on_tile_death_body_entered(_body: Node) -> void:
	GlobalMusic.play_fx(Paths.sound_jump)
	tile_death.apply_central_impulse(Vector2(0, -30))

func _on_tile_death_2_body_entered(_body: Node) -> void:
	GlobalMusic.play_fx(Paths.sound_jump)
	tile_death_2.apply_central_impulse(Vector2(0, -30))


func _on_gate_win() -> void:
	get_tree().change_scene_to_file("res://Levels/Level26/level_26.tscn")
