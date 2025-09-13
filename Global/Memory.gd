class_name Memory
extends Object

const PATH: StringName = "user://data"

static var file: ConfigFile

static func check_file():
	if not file:
		file = ConfigFile.new()
		file.load(PATH)

static func get_data(section:String, key:String, default:Variant) -> Variant:
	check_file()
	return file.get_value(section, key, default)

static func set_data(section:String, key:String, default:Variant) -> void:
	check_file()
	file.set_value(section, key, default)
	file.save(PATH)
