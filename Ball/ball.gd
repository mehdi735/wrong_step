extends RigidBody2D


func _on_body_entered(_body: Node) -> void:
	GlobalMusic.play_fx(Paths.sound_jump)
