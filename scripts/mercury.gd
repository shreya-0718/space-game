extends TextureButton


func _on_pressed():
	global.mercury_stars = 0
	get_tree().change_scene_to_file("res://scenes/mercury.tscn")
