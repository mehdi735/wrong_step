extends AudioStreamPlayer

#var _music: AudioStreamMP3

func _ready() -> void:
	get_tree().change_scene_to_file(Memory.get_data("level", "path_level", "res://Levels/Level1/level_1.tscn"))
	bus = "Music"
	#play_music()
	await get_tree().create_timer(1.0).timeout
	process_mode = Node.PROCESS_MODE_ALWAYS

func play_music(music:AudioStreamMP3, volume:float=0.0):
	if is_inside_tree():
		volume_db = volume
		if stream == music:
			return
		stream = music
		play()

func play_fx(music:AudioStream, volume:float = 0.0, is_area:bool=false, parent:Node=self, max_distance:int=2000) -> void:
	var fx: Node

	if is_area:
		fx = AudioStreamPlayer2D.new()
		fx.max_distance = max_distance
		parent.add_child(fx)

	else:
		fx = AudioStreamPlayer.new()
		add_child(fx)

	fx.bus = "SFX"
	fx.stream = music
	fx.volume_db = volume
	fx.play()
	await fx.finished
	fx.queue_free()
