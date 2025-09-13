class_name Spike
extends Area2D

signal finished

@export var time_change_pos: float = 0.5
@export var new_pos: Vector2
@export var array_new_pos: PackedVector2Array

var index: int

func change_pos() -> void:
	if new_pos:
		GlobalMusic.play_fx(Paths.trap)
		var tween: Tween = create_tween()
		tween.tween_property(self, "global_position", new_pos, time_change_pos)
		new_pos = Vector2.ZERO
		await tween.finished
		finished.emit()

	elif array_new_pos.size() > index:
		for pos: Vector2 in array_new_pos:
			GlobalMusic.play_fx(Paths.trap)
			var tween: Tween = create_tween()
			tween.tween_property(self, "global_position", pos, time_change_pos)
			index += 1
			await tween.finished
		finished.emit()
