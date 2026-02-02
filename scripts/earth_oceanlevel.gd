extends Node2D


func _process(delta):
	if global.passedearth:
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://scenes/levelpage1.tscn")
	
