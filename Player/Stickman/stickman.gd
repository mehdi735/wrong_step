class_name Player
extends CharacterBody2D

@export var speed: int = 10000
@export var jump: int = -400
@export var gravity: int = 1000

@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var button_left_sprite: Sprite2D = $CanvasLayer/ButtonLeft/ButtonLeftSprite
@onready var button_right_sprite: Sprite2D = $CanvasLayer/ButtonRight/ButtonRightSprite
@onready var button_jump_sprite: Sprite2D = $CanvasLayer/ButtonJump/ButtonJumpSprite
@onready var animated_sprite_2: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree

var direction: int
var is_jump: bool
var is_pressed_right: bool 
var is_pressed_left: bool
var is_pressed_jump: bool

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		_on_button_jump_pressed()
	elif Input.is_action_just_released("ui_accept"):
		_on_button_jump_released()

	if Input.is_action_just_pressed("ui_left"):
		_on_button_left_pressed()
	elif Input.is_action_just_released("ui_left"):
		_on_button_left_released()

	if Input.is_action_just_pressed("ui_right"):
		_on_button_right_pressed()
	elif Input.is_action_just_released("ui_right"):
		_on_button_right_released()

func _physics_process(delta: float) -> void:
	if !is_on_floor():
		animation_tree["parameters/idle_run_jump/BlendSpace1D/blend_position"] = 1.0
		velocity.y += delta * gravity

	elif velocity == Vector2.ZERO and !animation_tree["parameters/idle_run_jump/BlendSpace1D/blend_position"] == 0.5:
		animation_tree["parameters/idle_run_jump/BlendSpace1D/blend_position"] = 0.0

	elif velocity != Vector2.ZERO and animation_tree["parameters/idle_run_jump/BlendSpace1D/blend_position"] == 1.0:
		animation_tree["parameters/idle_run_jump/BlendSpace1D/blend_position"] = 0.5

	if is_on_floor() and is_jump:
		velocity.y += jump
		GlobalMusic.play_fx(preload("res://Assets/sound/jump.wav"))


	velocity.x = direction * speed * delta

	move_and_slide()


func _on_button_left_pressed() -> void:
	animation_tree["parameters/idle_run_jump/BlendSpace1D/blend_position"] = 0.5
	animated_sprite_2.flip_h = true
	is_pressed_left = true
	button_left_sprite.frame = 3
	direction = -1

func _on_button_left_released() -> void:
	is_pressed_left = false
	button_left_sprite.frame = 0

	if is_pressed_right:
		direction = 1
		animated_sprite_2.flip_h = false

	else:
		animation_tree["parameters/idle_run_jump/BlendSpace1D/blend_position"] = 0.0
		direction = 0


func _on_button_right_pressed() -> void:
	animation_tree["parameters/idle_run_jump/BlendSpace1D/blend_position"] = 0.5
	button_right_sprite.frame = 3
	is_pressed_right = true
	animated_sprite_2.flip_h = false
	direction = 1

func _on_button_right_released() -> void:
	is_pressed_right = false
	button_right_sprite.frame = 0

	if is_pressed_left:
		direction = -1
		animated_sprite_2.flip_h = true

	else:
		animation_tree["parameters/idle_run_jump/BlendSpace1D/blend_position"] = 0.0
		direction = 0


func _on_button_jump_pressed() -> void:
	button_jump_sprite.frame = 3
	is_pressed_jump = true
	is_jump = true


func _on_button_jump_released() -> void:
	button_jump_sprite.frame = 0
	is_pressed_jump = false
	is_jump = false


func _on_death_area_area_entered(_area: Node2D) -> void:
	for child: Node in canvas_layer.get_children():
		child.process_mode = Node.PROCESS_MODE_DISABLED
	animation_tree["parameters/conditions/death"] = true
	gravity *= -1


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == "death": get_tree().reload_current_scene()
