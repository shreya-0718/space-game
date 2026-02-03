extends TextureButton

@onready var txtt = get_node("../Label2")

func _on_pressed():
	txtt.visible = true 
	global.mercury_stars = 0
	get_tree().change_scene_to_file("res://scenes/mercury.tscn")
