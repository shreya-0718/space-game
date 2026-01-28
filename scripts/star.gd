extends Area2D

func _on_body_entered(body: Node2D):
	if body.name == "astronaut":
		if get_tree().current_scene.scene_file_path == "res://scenes/mercury.tscn":
			global.mercury_stars += 1
		if get_tree().current_scene.scene_file_path == "res://scenes/venus.tscn":
			global.venus_stars += 1
		queue_free()
