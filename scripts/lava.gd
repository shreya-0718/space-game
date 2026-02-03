extends Area2D

func _on_body_entered(body):
	if body.name == "astronaut":
		global.earth_stars = 0
		get_tree().change_scene_to_file("res://scenes/earth_forest.tscn")
