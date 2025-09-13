extends Node2D

@onready var spike: Spike = $Spike
@onready var spike_2: Spike = $Spike2
@onready var spike_3: Spike = $Spike3
@onready var spike_4: Spike = $Spike4
@onready var array_gate_fake: Array[Gate] = [ $GateFake4, $GateMain]
@onready var ray_cast: RayCast2D = $Spike/RayCast
@onready var ray_cast_2: RayCast2D = $Spike2/RayCast2
@onready var ray_cast_3: RayCast2D = $Spike3/RayCast3
@onready var ray_cast_4: RayCast2D = $Spike4/RayCast4


func _physics_process(_delta: float) -> void:
	spike_ray_cast(ray_cast, spike)
	spike_ray_cast(ray_cast_2, spike_2)
	spike_ray_cast(ray_cast_3, spike_3)
	spike_ray_cast(ray_cast_4, spike_4)
	gate_ray_cast()

func spike_ray_cast(_ray_cast:RayCast2D, _spike:Spike) -> void:
	if _ray_cast.is_colliding():
		_ray_cast.collision_mask = 0
		_spike.change_pos()

func gate_ray_cast() -> void:
	if ray_cast_4.is_colliding():
		for gate: Gate in array_gate_fake:
			gate.change_pos()


func _on_gate_main_win() -> void:
	get_tree().change_scene_to_file("res://Levels/Level20/level_20.tscn")
