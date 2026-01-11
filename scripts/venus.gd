extends TextureButton


func _on_pressed():
	global.venus_stars = 0
	get_tree().change_scene_to_file("res://scenes/venus.tscn")
