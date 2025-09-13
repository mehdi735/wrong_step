class_name Gate
extends Area2D

signal win
signal changed_pos
signal changed_pos_array(index:int)
signal finished

@export var time_change_pos: float = 0.5
@export var new_pos: Vector2
@export var array_new_pos: PackedVector2Array

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	if get_tree().current_scene.scene_file_path != "res://Levels/Level1/level_1.tscn":
		Memory.set_data("level", "path_level", get_tree().current_scene.scene_file_path)


var index: int

func change_pos(body: CharacterBody2D = null) -> void:
	if new_pos:
		GlobalMusic.play_fx(Paths.trap)
		var tween: Tween = create_tween()
		tween.tween_property(self, "global_position", new_pos, time_change_pos)
		new_pos = Vector2.ZERO
		changed_pos.emit()
		await tween.finished
		finished.emit()

	elif array_new_pos.size() > index:
		collision_mask = 0
		for pos: Vector2 in array_new_pos:
			GlobalMusic.play_fx(Paths.trap)
			var tween: Tween = create_tween()
			tween.tween_property(self, "global_position", array_new_pos[index], time_change_pos)
			changed_pos.emit()
			changed_pos_array.emit(index)
			index += 1
			await tween.finished
			collision_mask = 2
			break

		finished.emit()

	else:
		var tween: Tween = create_tween()
		body.scale = Vector2(0.7, 0.7)
		body.global_position = animated_sprite_2d.global_position
		animated_sprite_2d.frame = 1
		body.collision_layer = 0
		body.collision_mask = 0
		body.process_mode = Node.PROCESS_MODE_DISABLED


		GlobalMusic.play_fx(load("res://Assets/sound/win_gate.mp3"))
		var tween_2: Tween = create_tween()
		tween.tween_property(self, "scale:y", 0.0, 1.0)
		tween_2.tween_property(body, "scale:y", 0.0, 1.0)

		await tween_2.finished
		win.emit()

func _on_body_entered(body: CharacterBody2D) -> void:
	change_pos(body)
