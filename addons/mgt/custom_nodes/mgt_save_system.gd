extends Node

const DEFAULT_FILE = "res://save/general.json"
var save_files = {}

func add_property(node, property, save_file = DEFAULT_FILE):
	if not save_files.has(save_file):
		save_files[save_file] = {}
	
	if not save_files[save_file].has(node):
		save_files[save_file][node] = {}
	
	var p = get_node(node).get(property)
	if typeof(p) == TYPE_VECTOR2:
		save_files[save_file][node][property] = {"x": p.x, "y": p.y}
	else:
		save_files[save_file][node][property] = get_node(node).get(property)

func load_property(node, property, save_file = DEFAULT_FILE):
	assert(save_files.has(save_file))
	assert(save_files[save_file].has(node))
	assert(save_files[save_file][node].has(property))
	
	var p = get_node(node).get(property)
	if typeof(p) == TYPE_VECTOR2:
		var v = Vector2()
		v.x = save_files[save_file][node][property].x
		v.y = save_files[save_file][node][property].y
		get_node(node).set(property, v)
	else:
		get_node(node).set(property, save_files[save_file][node][property])

func store_file(save_file = DEFAULT_FILE, overwrite = true):
	var file = File.new()
	
	if file.file_exists(save_file):
		if overwrite:
			file.open(save_file, File.WRITE)
		else:
			print("WARNING: file "+save_file+" already exists.")
	else:
		file.open(save_file, File.WRITE)
	
	file.store_string(to_json(save_files[save_file]))
	
	file.close()

func load_save_file(save_file = DEFAULT_FILE):
	assert(save_files.has(save_file))
	
	for node in save_files[save_file]:
		for property in save_files[save_file][node]:
			var p = get_node(node).get(property)
			if typeof(p) == TYPE_VECTOR2:
				var v = Vector2()
				v.x = save_files[save_file][node][property].x
				v.y = save_files[save_file][node][property].y
				get_node(node).set(property, v)
			else:
				get_node(node).set(property, save_files[save_file][node][property])

func read_file(save_file = DEFAULT_FILE):
	var file = File.new()
	
	assert(file.file_exists(save_file))
	
	file.open(save_file, File.READ)
	
	save_files[save_file] = parse_json(file.get_as_text())
	
	file.close()

func clear():
	save_files.clear()

func delete_save_file(save_file = DEFAULT_FILE):
	var dir = Directory.new()
	
	assert(dir.file_exists(save_file))
	
	dir.remove(save_file)