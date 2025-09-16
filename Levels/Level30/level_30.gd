extends Node2D

@onready var balls: Array[RigidBody2D] = [$Ball, $Ball2]
@onready var stickman: Player = $Stickman


func _on_stickman_jumped() -> void:
	for ball: RigidBody2D in balls:
		ball.apply_central_impulse(-(stickman.global_position - ball.global_position).normalized() * 500)
